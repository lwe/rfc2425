module Rfc2425
  class DirectoryInformation < Directory    
    # The profile used by this directory information object,
    # like +VCARD+.
    attr_accessor :profile
    
    # Build a new directory information object, kind of a 
    # simple builder.
    #
    #   # create a VCard, Version 3.0
    #   di = DirectoryInformation.new(:vcard, :version => 3.0)
    #   di.fn = ...
    #
    # Also accepts a block to further build the instance:
    #
    #   # build in block
    #   di = DirectoryInformation.new(:vcard) do |d|
    #     d.name = "Peter Gibbons"
    #     d.email << "peter.gibbons@initech.com"
    #   end
    #
    def initialize(profile = nil, properties = {}, &block)
      super()
      self.profile = profile
      properties.each { |k,v| self << Property.new(k, v) }
      yield self if block_given?
    end
    
    def to_s
      profile_str = profile ? ":#{profile.to_s.upcase}" : ""
      "BEGIN#{profile_str}\n" << super << "\nEND#{profile_str}"
    end    
  end
end