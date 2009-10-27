module Rfc2425
  module Utils
    def namerize(str, upcase = true)
      str = str.to_s.gsub(/_/, '-').gsub(/\s/, '')
      str.upcase! if upcase
      str
    end
    module_function :namerize
    
    def escape(str)
      str.to_s.gsub(/([,;:\\])/, '\\\\\1').gsub(/\r?\n/, '\n')
    end
    module_function :escape
  end
end