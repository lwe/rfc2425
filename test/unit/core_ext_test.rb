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
  
  context "TimeSupport" do
    setup do
      Time.zone = 'Bern'
    end
    
    should "convert to date string" do
      assert_equal "20090730T130000Z", Time.utc(2009, 7, 30, 13, 0, 0, 0).as_rfc2425
    end
    
    should "always convert to UTC" do
      assert_equal '20090730T130000Z', Time.local(2009, 7, 30, 15, 0, 0, 0).as_rfc2425
    end
    
    context "ActiveSupport" do
      should "convert DateTime instances to UTC string" do
        assert_equal '20090801T130000Z', DateTime.parse('20090801T150000+0200').as_rfc2425
      end
      
      should "convert TimeWithZone instances to UTC string" do
        assert_equal '20090919T100000Z', Time.zone.local(2009, 9, 19, 12, 0, 0, 0).as_rfc2425
      end
    end
  end
  
  context "DateSupport" do
    setup do
      Time.zone = 'Bern'
    end
    
    should "convert Date instances to YYYY-MM-DD string" do
      assert_equal '1987-07-30', Date.new(1987, 7, 30).as_rfc2425
    end
  end
end