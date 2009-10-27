module Rfc2425
  class Directory
    # clear anything!
    instance_methods.each { |m| undef_method m unless m =~ /(^__|^send$|^object_id$)/ }

    def initialize(properties = [], name = nil, params = nil)
      @properties = properties
      @name = name
      @params = params
    end

    def properties; @properties ||= [] end
    
    def <<(property)
      if @name
        properties << Property.new(@name, property, @params)
      else
        properties << property
      end
    end
    
    def to_s
      properties.join("\n")
    end
    
    protected
      def method_missing(method, *args, &block)
        method = method.to_s
        if @name and method == 'is='
          self.properties.delete_if { |p| p.respond_to?(:name) && Utils.namerize(p.name) == Utils.namerize(@name) }
          self.properties << Property.new(@name, args[0], @params)
        elsif method =~ /=\z/
          self.properties.delete_if { |p| p.respond_to?(:name) && Utils.namerize(p.name) == Utils.namerize(method.chop) }
          self << Property.new(method.chop, args[0])
        else
          Directory.new(self.properties, method, args[0])
        end        
      end    
  end
end