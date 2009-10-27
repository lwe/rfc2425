require 'test_helper'
require 'rfc2425/utils'

class UtilsTest < Test::Unit::TestCase
  include Rfc2425::Utils
  
  context "Utils#namerize" do
    should "convert underscores to dashes, remove any spaces and upcase" do
      assert_equal "NAME", namerize("NAME")
      assert_equal "X-AIM", namerize("x_aim")
      assert_equal "OTHER", namerize(" o t h e r ")
    end
    
    should "work with symbols as well" do
      assert_equal "NAME", namerize(:name)
      assert_equal "X-JABBER", namerize(:x_jabber)
    end
    
    should "leave case as is if upcase = false, yet all other conversions remain!" do
      assert_equal "name", namerize(:name, false)
      assert_equal "x-aim", namerize(:x_aim, false)
      assert_equal "Other", namerize(" O t h e r ", false)
    end
  end
end