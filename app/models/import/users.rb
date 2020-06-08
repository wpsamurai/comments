module Import
  class Users < Base
    def import
      users = []
      data.each do |user_hash|
        next if already_imported?(user_hash[:external_id])

        user = ::User.new(user_hash)

        if user.valid?
          users << user
        else
          log_errors(user)
        end
      end

      ::User.import!(users)

      self
    end

    private

      def data
        @data ||= @source.users
      end

      def already_imported?(external_id)
        User.exists?(external_id: external_id)
      end
  end
end
