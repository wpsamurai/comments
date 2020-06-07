module Import
  class Users < Base
    def import
      users = []
      data.each do |user_hash|
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
  end
end
