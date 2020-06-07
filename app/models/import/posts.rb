module Import
  class Posts < Base
    def import
      posts = []
      data.each do |post_hash|
        post = ::Post.new(post_hash)

        if post.valid?
          posts << post
        else
          log_errors(post)
        end
      end

      ::Post.import!(posts)

      self
    end

    private

      def data
        @data ||= @source.posts
      end
  end
end
