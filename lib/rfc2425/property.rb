module Rfc2425
  class Property
    attr_accessor :name, :value, :params
    def initialize(name, value, params = {})
      self.name = name
      self.value = value
      self.params = params
    end
    
    def params?
      params && !params.empty?
    end
    
    def to_s
      "#{Utils.namerize(name)}#{params? ? ';' + params.as_rfc2425 : ''}:#{value.as_rfc2425}"
    end        
  end
end