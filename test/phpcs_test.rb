require 'minitest/autorun'
require 'phpcs'
require 'minitest/pride'

class PhpcsTest < Minitest::Test
  def test_foo
    file = File.open('test/fixtures/foo.php')
    results = Phpcs.lint(file.read)

    assert_equal results[0].line, 3
    assert_equal results[0].comment, 'Each class must be in a namespace of at least one level (a top-level vendor name)'
    assert_equal results[1].line, 3
    assert_equal results[1].comment, 'Opening brace of a class must be on the line after the definition'
    assert_equal results[2].line, 7
    assert_equal results[2].comment, 'A closing tag is not permitted at the end of a PHP file'
  end
end
