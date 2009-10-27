module Rfc2425
  class DirectoryInformation
    # clear anything!
    instance_methods.each { |m| undef_method m unless m =~ /(^__|^send$|^object_id$)/ }
    
    def initialize(profile = nil, properties = {}, &block)
      yield self if block_given?
    end
    
    def properties
      @properties ||= []
    end
    
    def <<(property)
      properties << property
    end
    
    def to_s
      str = "BEGIN\n" << properties.join("\n") << "\nEND"
    end
    
    protected
      def method_missing(method, *args, &block)
        []
      end
  end
end