require 'test_helper'
require 'rfc2425/utils'
require 'rfc2425/core_ext'

class CoreExtTest < Test::Unit::TestCase
  include Rfc2425::CoreExt
  
  context "ObjectSupport" do
    should "escape , ; and \\ in strings when calling #as_rfc2425" do
      assert_equal "test", "test".as_rfc2425
      assert_equal "test\\;", "test;".as_rfc2425
      assert_equal "this\\, other", "this, other".as_rfc2425
      assert_equal "OMG\\\\Oops", 'OMG\Oops'.as_rfc2425
    end
    
    should "convert newlines (CRLF and LFs) to \\n" do
      assert_equal "test\\nline", "test\nline".as_rfc2425
      assert_equal "test\\nline", "test\r\nline".as_rfc2425
    end
  end
  
  context "ArraySupport" do
    should "join all elements using ;" do
      assert_equal "test;other", %w{test other}.as_rfc2425
    end
    
    should "escape all inner elements with ObjectSupport" do
      assert_equal "test\\;other;didum\\nline;hehe", ['test;other', "didum\nline", 'hehe'].as_rfc2425
    end
    
    should "also take care of symbols" do
      assert_equal "other;test", [:other, :test].as_rfc2425
    end    
  end
  
  context "HashSupport" do
    should "convert to simple key1=value1;keyN=valueN string, always sorted by key name" do
      assert_equal "language=de;type=work", { :type => 'work', :language => :de }.as_rfc2425
    end
    
    should "handle inner arrays slightly differnt, using , as delimiter" do
      assert_equal "type=work,home", { :type => %w{work home} }.as_rfc2425
    end
  end
end