require 'test_helper'
require 'rfc2425'

class BuilderTest < Test::Unit::TestCase
  include Rfc2425
  
  context "DirectoryInformation#new" do
    should "handle first argument as profile and hash as normal properties" do
      di = DirectoryInformation.new(:vcard, :version => 3.0)
      assert_equal "BEGIN:VCARD\nVERSION:3.0\nEND:VCARD", di.to_s
    end
    
    should "yield instance to block to build upon it" do
      di = DirectoryInformation.new(:vcard, :version => 3.0) do |d|
        d.fn = "Peter Gibbons"
        d.n = %w{Gibbons Peter}
        d.org = 'Initech Corp.'
        d.email(:type => :work) << 'peter.gibbons@initech.org'        
      end
      
      exp = %Q{BEGIN:VCARD
VERSION:3.0
FN:Peter Gibbons
N:Gibbons;Peter
ORG:Initech Corp.
EMAIL;type=work:peter.gibbons@initech.org
END:VCARD}
      assert_equal exp, di.to_s
    end
    
    should "allow adding multiple attributes with the same name" do
      di = DirectoryInformation.new do |d|
        d.name = "Peter Gibbons"
        d.some << "attribute"
        d.some(:language => :de, :value => :test) << "Attribut"
      end
      
      exp = %Q{BEGIN
NAME:Peter Gibbons
SOME:attribute
SOME;language=de;value=test:Attribut
END}
      assert_equal exp, di.to_s
    end
    
    should "override value if set using =" do
      di = DirectoryInformation.new { |d| d.n = "Peter" }
      di.n = "Gibbons"
      
      assert_equal "BEGIN\nN:Gibbons\nEND", di.to_s
      
      di.n(:x => 'y').is = 'Gibby' # well, too bad n(:x => 'y') = 'value' doesnt work :(
      assert_equal "BEGIN\nN;x=y:Gibby\nEND", di.to_s
    end
  end
end