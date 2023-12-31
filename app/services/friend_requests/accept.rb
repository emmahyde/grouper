module FriendRequests
  class Accept
    include Serviceable

    def initialize(friendship_id:)
      @friendship = Friendship.find(friendship_id)
    end

    attr_reader :friendship

    def call
      Friendship.create!(
        user:   friendship.friend,
        friend: friendship.user,
      )
    end
  end
end
