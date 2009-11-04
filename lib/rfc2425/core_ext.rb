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
    
    module TimeSupport
      def as_rfc2425
        getutc.strftime('%Y%m%dT%H%M%SZ')
      end
    end
    
    module DateSupport
      def as_rfc2425
        strftime('%Y-%m-%d')
      end
    end
  end
end

::Object.send(:include, Rfc2425::CoreExt::ObjectSupport)
::Array.send(:include, Rfc2425::CoreExt::ArraySupport)
::Hash.send(:include, Rfc2425::CoreExt::HashSupport)
::Time.send(:include, Rfc2425::CoreExt::TimeSupport)

# setup ActiveSupport time formats
::DateTime.send(:include, Rfc2425::CoreExt::TimeSupport) if defined?(::DateTime)
::Date.send(:include, Rfc2425::CoreExt::DateSupport) if defined?(::Date)
::ActiveSupport::TimeWithZone.send(:include, Rfc2425::CoreExt::TimeSupport) if defined?(::ActiveSupport)