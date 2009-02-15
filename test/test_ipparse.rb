require File.join(File.dirname(__FILE__),"..","lib","ipparse.rb")
require 'test/unit'

class TestIPParse < Test::Unit::TestCase
  def test_parse
    assert_equal IPParse.parse('222.153.3'),false
    assert_equal IPParse.parse('222.15.153.3'),"江西省云南市"
    assert_equal IPParse.parse('24.38.192.2'),"美国"
  end

  def test_format
    assert_equal IPParse.format('12.3.4.23'),'012.003.004.023'
    assert_equal IPParse.format('12.*.4.23'),'012.255.004.023'
  end
end
