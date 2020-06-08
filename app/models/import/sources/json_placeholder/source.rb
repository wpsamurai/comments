module Import
  module Sources
    module JsonPlaceholder
      class Source
        def initialize(logger = nil)
          @logger = logger || Logger.new
        end

        def users
          JsonPlaceholder::Users.new(client.users).convert
        end

        def posts
          JsonPlaceholder::Posts.new(client.posts).convert
        end

        def comments
          JsonPlaceholder::Comments.new(client.comments).convert
        end

        private

          def client
            @client ||= Api::JsonPlaceholder::Client.new
          end
      end
    end
  end
end
