module FriendRequests
  class Accept
    include Serviceable

    def initialize(friendship:)
      @friendship = friendship
    end

    def call
      @friendship.update!(
        mutual: true,
      )

      Friendship.create!(
        user:   @friendship.friend,
        friend: @friendship.user,
        mutual: true,
      )
    end
  end
end
