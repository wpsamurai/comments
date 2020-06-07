module Import
  module Sources
    module JsonPlaceholder
      class Users
        def initialize(users)
          @users = users
        end

        def convert
          result = []
          @users.each do |user|
            result << user_hash(user)
          end

          result
        end

        private

          def user_hash(user)
            {
              name: user['name'],
              username: user['username'],
              email: user['email'],
              external_id: user['id']
            }
          end
      end
    end
  end
end
