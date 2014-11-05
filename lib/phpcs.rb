require 'tempfile'
require 'base64'
require 'open3'
require 'json'

module Phpcs
  class Match < Struct.new(:line, :comment)
  end

  class << self
    def lint(content)
      code = Base64.encode64(content).strip[0..16]
      file = Tempfile.new(code)
      file.write(content)
      file.close

      stdin, stdout, stderr, wait_thr = Open3.popen3('phpcs', file.path, '--standard=PSR2', '--report=json')

      out = JSON.load(stdout.read)

      if out['totals']['errors'] > 0
        parse_matches(out)
      else
        []
      end
    end

    def parse_matches(body)
      path = body['files'].keys.first
      errors = body['files'][path]
      matches = []

      errors['messages'].each do |error|
        matches << Match.new(error['line'], error['message'])
      end
      matches
    end
  end
end
