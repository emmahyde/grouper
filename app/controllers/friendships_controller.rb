class FriendshipsController < ApplicationController
  def create
    @friendship = FriendRequests::Send.call(
      from_user: params[:user_id],
      to_user:   params[:friend_id],
    )

    render @friendship, status: :created
  end

  def accept
    @friendship = FriendRequests::Accept.call(
      friendship_id: params[:friendship_id],
    )

    render @friendship, status: :created
  end

  private

  def create_params
    params.permit(:from_user_id, :to_user_id)
  end

  def accept_params
    params.permit(friendship_id: [])
  end
end
