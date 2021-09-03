class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new
        end
    end
  
# need to understand params and session - wouldn't have come up with this on my own.
# what is session?
    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end