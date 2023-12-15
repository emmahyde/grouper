class ApplicationController < ActionController::Base
    helper_method :current_user

    # Helper Method for assigning current user. To be removed after implementing authentication.
    def current_user
        @current_user ||= User.find_by(nam: "Alice")
    end
end
