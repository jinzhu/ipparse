# -*- coding: utf-8 -*-
require File.expand_path(File.join(File.dirname(__FILE__),"..","lib","ipparse.rb"))
require 'test/unit'

class TestIPParse < Test::Unit::TestCase
  def test_parse
    assert_equal IPParse.parse('222.153.3'),false
    ips = {
      "138.0.0.1"  => "Unknown",
      "218.58.88.175" => "山东省青岛市开发区",
      "212.1.1.1"     => "荷兰",
      "192.245.148.0" => "阿尔及利亚",
      "116.254.254.0" => "广东省广州市",
      "116.254.254.0" => "广东省广州市",
      "16.34.110.150" => "美国",
      #"222.15.153.3"  => "江西省云南市",
      "24.38.192.2"   => "北美地区",
      "222.249.31.53" => "北京市"
    }
    ips.map {|k,v| assert_equal IPParse.parse(k),v}
  end
end
