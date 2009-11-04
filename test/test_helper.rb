require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'rr'

# to test rails extensions
require 'activesupport'

Test::Unit::TestCase.send :include, RR::Adapters::TestUnit
