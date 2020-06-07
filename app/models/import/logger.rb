module Import
  class Logger
    attr_reader :messages

    def initialize
      @messages = {
        warnings: [],
        errors: []
      }
    end

    def warn(message)
      @messages[:warnings] << message
    end

    def error(message)
      @messages[:errors] << message
    end
  end
end