module Import
  class Base
    attr_reader :logger

    def self.import(source, logger = nil)
      new(source, logger).import
    end

    def initialize(source, logger = nil)
      @source = source
      @logger = logger || Logger.new
    end

    protected

      def log_errors(item)
        item.errors.messages.each do |key, message|
          @logger.error("#{key.to_s.humanize} #{message.first}")
        end
      end
  end
end
