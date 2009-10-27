module Rfc2425
  module CoreExt
    module ObjectSupport
      def as_rfc2425(options = {})
        Rfc2425::Utils.escape(self)
      end
    end
    
    module ArraySupport
      def as_rfc2425(options = {})
        map { |e| e.as_rfc2425 }.join(options[:delimiter] || ';')
      end
    end
    
    module HashSupport
      def as_rfc2425(options = {})
        map { |k, v| "#{k}=#{v.as_rfc2425(:delimiter => ',')}" }.sort.join(';')
      end
    end
  end
end

::Object.send(:include, Rfc2425::CoreExt::ObjectSupport)
::Array.send(:include, Rfc2425::CoreExt::ArraySupport)
::Hash.send(:include, Rfc2425::CoreExt::HashSupport)