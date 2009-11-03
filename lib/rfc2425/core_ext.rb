module Rfc2425
  module CoreExt
    module ObjectSupport
      def as_rfc2425
        Rfc2425::Utils.escape(self)
      end
    end
    
    module ArraySupport
      def as_rfc2425_with_delim(delim = ';')
        map { |e| e.as_rfc2425 }.join(delim)
      end
      alias_method :as_rfc2425, :as_rfc2425_with_delim
    end
    
    module HashSupport
      def as_rfc2425
        map { |k, v| "#{k}=#{v.is_a?(Array) ? v.as_rfc2425_with_delim(',') : v.as_rfc2425}" }.sort.join(';')
      end
    end
  end
end

::Object.send(:include, Rfc2425::CoreExt::ObjectSupport)
::Array.send(:include, Rfc2425::CoreExt::ArraySupport)
::Hash.send(:include, Rfc2425::CoreExt::HashSupport)