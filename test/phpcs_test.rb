require 'minitest/autorun'
require 'phpcs'
require 'minitest/pride'

class PhpcsTest < Minitest::Test
  def test_defaut_standard
    file = File.open('test/fixtures/foo.php')
    phpcs = Phpcs::Phpcs.new
    results = phpcs.lint(file.read)

    assert_equal results[0].line, 3
    assert_equal results[0].comment, 'Each class must be in a namespace of at least one level (a top-level vendor name)'
    assert_equal results[1].line, 3
    assert_equal results[1].comment, 'Opening brace of a class must be on the line after the definition'
    assert_equal results[2].line, 5
    assert_equal results[2].comment, 'Spaces must be used to indent lines; tabs are not allowed'
    assert_equal results[3].line, 5
    assert_equal results[3].comment, 'Line indented incorrectly; expected at least 4 spaces, found 1'
    assert_equal results[4].line, 5
    assert_equal results[4].comment, 'Line indented incorrectly; expected 4 spaces, found 1'
    assert_equal results[5].line, 5
    assert_equal results[5].comment, 'Opening brace should be on a new line'
    assert_equal results[6].line, 6
    assert_equal results[6].comment, 'Spaces must be used to indent lines; tabs are not allowed'
    assert_equal results[7].line, 6
    assert_equal results[7].comment, 'Line indented incorrectly; expected at least 8 spaces, found 3'
    assert_equal results[8].line, 7
    assert_equal results[8].comment, 'Spaces must be used to indent lines; tabs are not allowed'
    assert_equal results[9].line, 9
    assert_equal results[9].comment, 'The closing brace for the class must go on the next line after the body'
    assert_equal results[10].line, 11
    assert_equal results[10].comment, 'A closing tag is not permitted at the end of a PHP file'
  end

  def test_pear_standard
    file = File.open('test/fixtures/foo.php')
    phpcs = Phpcs::Phpcs.new('PEAR')
    results = phpcs.lint(file.read)

    assert_equal results[0].line, 2
    assert_equal results[0].comment, 'Missing file doc comment'
    assert_equal results[1].line, 3
    assert_equal results[1].comment, 'Missing class doc comment'
    assert_equal results[2].line, 3
    assert_equal results[2].comment, 'Opening brace of a class must be on the line after the definition'
    assert_equal results[3].line, 5
    assert_equal results[3].comment, 'Spaces must be used to indent lines; tabs are not allowed'
    assert_equal results[4].line, 5
    assert_equal results[4].comment, 'Line indented incorrectly; expected at least 4 spaces, found 1'
    assert_equal results[5].line, 5
    assert_equal results[5].comment, 'Missing function doc comment'
    assert_equal results[6].line, 5
    assert_equal results[6].comment, 'Line indented incorrectly; expected 4 spaces, found 1'
    assert_equal results[7].line, 5
    assert_equal results[7].comment, 'Opening brace should be on a new line'
    assert_equal results[8].line, 6
    assert_equal results[8].comment, 'Spaces must be used to indent lines; tabs are not allowed'
    assert_equal results[9].line, 6
    assert_equal results[9].comment, 'Line indented incorrectly; expected at least 8 spaces, found 3'
    assert_equal results[10].line, 7
    assert_equal results[10].comment, 'Spaces must be used to indent lines; tabs are not allowed'
  end

  def test_zend_standard
    file = File.open('test/fixtures/foo.php')
    phpcs = Phpcs::Phpcs.new('Zend')
    results = phpcs.lint(file.read)

    assert_equal results[0].line, 3
    assert_equal results[0].comment, 'Opening brace of a class must be on the line after the definition'
    assert_equal results[1].line, 5
    assert_equal results[1].comment, 'Spaces must be used to indent lines; tabs are not allowed'
    assert_equal results[2].line, 5
    assert_equal results[2].comment, 'Opening brace should be on a new line'
    assert_equal results[3].line, 6
    assert_equal results[3].comment, 'Spaces must be used to indent lines; tabs are not allowed'
    assert_equal results[4].line, 7
    assert_equal results[4].comment, 'Spaces must be used to indent lines; tabs are not allowed'
    assert_equal results[5].line, 11
    assert_equal results[5].comment, 'A closing tag is not permitted at the end of a PHP file'
  end


end
