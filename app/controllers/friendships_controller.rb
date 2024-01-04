class FriendshipsController < ApplicationController
  def index
    @friendships = {
      outgoing: Friendship.where(user: current_user).to_a,
      incoming: Friendship.where(friend: current_user).to_a,
      mutuals: current_user.mutuals,
    }
  end

  def new; end

  def create
    @friendship = FriendRequests::Send.call(
      from_user: params[:user_id],
      to_user:   params[:friend_id],
    )
  end

  def accept
    @friendship = FriendRequests::Accept.call(
      friendship_id: params[:friendship_id],
    )
  end

  private

  def create_params
    params.permit(:from_user_id, :to_user_id)
  end

  def accept_params
    params.permit(friendship_id: [])
  end
end
