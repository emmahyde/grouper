module FriendRequests
  class Send
    include Serviceable

    # TODO: instead of using a Service architecture, we could rely on ActiveRecord lifecycle hooks...
    #       but this tends to get complicated quickly with all the implicit behaviors
    def initialize(from_user:, to_user:)
      @user   = from_user
      @friend = to_user
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
