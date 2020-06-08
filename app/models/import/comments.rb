module Import
  class Comments < Base
    def import
      comments = []
      data.each do |comment_hash|
        next if already_imported?(comment_hash[:external_id])

        comment = ::Comment.new(comment_hash)

        if comment.valid?
          comments << comment
        else
          log_errors(comment)
        end
      end

      ::Comment.import!(comments)

      self
    end

    private

      def data
        @data ||= @source.comments
      end

      def already_imported?(external_id)
        Comment.exists?(external_id: external_id)
      end
  end
end
