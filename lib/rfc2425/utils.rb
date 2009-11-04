module Rfc2425
  module Utils
    
    # Convert to valid and complete property name, normally
    # the results are upcased automatically.
    #
    #   Rfc2425::Utils.namerize(:name) # => "NAME"
    #   Rfc2425::Utils.namerize('x_aim') # => "X-AIM"
    #
    def namerize(str, upcase = true)
      str = str.to_s.gsub(/_/, '-').gsub(/\s/, '')
      str.upcase! if upcase
      str
    end
    module_function :namerize
    
    # Escape that string, as described in RFC.
    def escape(str)
      str.to_s.gsub(/([,;:\\])/, '\\\\\1').gsub(/\r?\n/, '\n')
    end
    module_function :escape
    
    # Split lines longer than +length+ with +delim+.
    def split_lines(str, length = 79, delim = "\n\t")
      str.to_s.scan(/.{#{length}}/).join(delim)
    end
    module_function :split_lines
  end
end