module Import
  module Sources
    module JsonPlaceholder
      class Posts
        def initialize(posts)
          @posts = posts
        end

        def convert
          result = []
          @posts.each do |post|
            result << post_hash(post)
          end

          result
        end

        private

        def post_hash(post)
          {
            title: post['title'],
            external_id: post['id'],
            user_id: User.find_by(external_id: post['userId'])&.id
          }
        end
      end
    end
  end
end
