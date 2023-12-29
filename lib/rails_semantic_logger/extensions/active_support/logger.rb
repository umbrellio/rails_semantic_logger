require "active_support/logger"

module ActiveSupport
  # More hacks to try and stop Rails from being it's own worst enemy.
  class Logger
    class << self
      undef :logger_outputs_to?
    end

    # Prevent Console from trying to merge loggers
    def self.logger_outputs_to?(*args)
      true
    end

    def self.new(*args, **kwargs)
      SemanticLogger[self]
    end
  end
end
