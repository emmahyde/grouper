module FriendRequests
  class Send
    include Serviceable

    def initialize(from:, to:)
      @user   = User.find from
      @friend = User.find to
    end

    attr_reader :user, :friend

    def call
      Friendship.create! user: user, friend: friend
    end
  end
end
