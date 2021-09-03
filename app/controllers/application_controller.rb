class ApplicationController < ActionController::Base
    before_action :set_current_user

    #what is before action?? 

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
            # why do we need a current.rb model? Wouldn't this come under user?
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
    end
end
