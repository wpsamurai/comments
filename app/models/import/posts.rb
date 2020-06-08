module Import
  class Posts < Base
    def import
      posts = []
      data.each do |post_hash|
        next if already_imported?(post_hash[:external_id])

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

      def already_imported?(external_id)
        Post.exists?(external_id: external_id)
      end
  end
end
