class UsersController < ApplicationController
    before_action :require_login, except: [:create]

    def create #creating new user
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to root_path
            else
                render 'sessions/signup'
            end
    end

    def show #no error handling
        user_authorized
        find_user
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_authorized
        if params[:id].to_i != session[:user_id]
            flash[:error] = "You are not authorized to access this profile"
            redirect_to root_path
        end
    end

end