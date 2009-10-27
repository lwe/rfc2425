require 'test_helper'
require 'rfc2425'

class LowlevelApiTest < Test::Unit::TestCase
  include Rfc2425
  
  context "DirectoryInformation" do
    should "accept adding Properties using <<" do
      di = DirectoryInformation.new
      di << Property.new(:a, "test")
      di << Property.new(:a, "other")
      di << Property.new(:b, %w{this has multiple values})
      di << Property.new(:b, "other", :with => "attribute")
      
      exp = %Q{BEGIN
A:test
A:other
B:this;has;multiple;values
B;with=attribute:other
END}
      assert_equal exp, di.to_s
    end
    
    should "accept adding strings as well using << (mix and match!)" do
      di = DirectoryInformation.new
      di << Property.new(:a, "test")
      di << "B:this;has;multiple;values"
      
      exp = %Q{BEGIN
A:test
B:this;has;multiple;values
END}
      assert_equal exp, di.to_s
    end
  end
end
