module FriendRequests
  class Send
    include Serviceable

    def initialize(from_user:, to_user:)
      @user   = User.find(from_user)
      @friend = User.find(to_user)
    end

    attr_reader :user, :friend

    def call
      Friendship.create!(
        user:   user,
        friend: friend,
      )
    end
  end
end
