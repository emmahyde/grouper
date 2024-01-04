class FriendshipsController < ApplicationController
  def index
    @friendships = {
      outgoing: current_user.outgoing_friend_requests,
      incoming: current_user.incoming_friend_requests,
      mutuals: current_user.mutual_friendships,
    }

    render @friendships, status: :ok
  end

  def new; end

  def create
    @friendship = FriendRequests::Send.call(
      from_user: current_user,
      to_user:   User.find(create_params[:to_user_id]),
    )

    render @friendship, status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :bad_request
  end

  def accept
    @friendship = FriendRequests::Accept.call(
      friendship: Friendship.find(accept_params[:friendship_id]),
    )

    render @friendship, status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def create_params
    params.permit(:to_user_id)
  end

  def accept_params
    params.permit(friendship_id: [])
  end
end
