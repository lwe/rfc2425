module Rfc2425
  module CoreExt
    module ObjectSupport
      def as_rfc2425
        Rfc2425::Utils.escape(to_s)
      end
    end
    
    module ArraySupport
      def as_rfc2425
        map { |e| e.as_rfc2425 }.join(';')
      end
    end
  end
end

::Object.send(:include, Rfc2425::CoreExt::ObjectSupport)
::Array.send(:include, Rfc2425::CoreExt::ArraySupport)