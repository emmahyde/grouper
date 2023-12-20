class FriendshipsController < ApplicationController
  def create
    @friendship = FriendRequests::Send.call(
      from: params[:user_id],
      to:   params[:friend_id],
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
    params.permit(:user_id, :friend_id)
  end

  def accept_params
    params.permit(friendship_id: [])
  end
end
