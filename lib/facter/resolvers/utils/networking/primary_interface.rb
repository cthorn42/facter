# frozen_string_literal: true

module Facter
  module Resolvers
    module Utils
      module Networking
        module PrimaryInterface
          class << self
            def get(log = nil)
              result = Facter::Core::Execution.execute('route -n get default', logger: log)

              result.match(/interface: (.+)/)&.captures&.first
            end
          end
        end
      end
    end
  end
end
