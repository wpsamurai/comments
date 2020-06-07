module Import
  module Sources
    module JsonPlaceholder
      class Comments
        def initialize(comments)
          @comments = comments
        end

        def convert
          result = []
          @comments.each do |comment|
            result << comment_hash(comment)
          end

          result
        end

        private

          def comment_hash(comment)
            {
              name: comment['name'],
              email: comment['email'],
              body: comment['body'],
              external_id: comment['id'],
              post_id: Post.find_by(external_id: comment['postId'])&.id
            }
          end
      end
    end
  end
end
