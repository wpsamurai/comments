module Import
  class Comments < Base
    def import
      comments = []
      data.each do |comment_hash|
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
  end
end
