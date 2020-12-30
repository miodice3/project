class ApplicationController < ActionController::Base

   before_action :require_login, except: [:aboutus, :login, :signup, :login_post, :googleAuth]

    def aboutus
    end

    private

    def current_user
        session[:user_id]
    end

    def find_user
        @user = User.find_by(id: current_user)
    end

    def require_login
        unless current_user
            flash[:error] = "You must be logged in to access this section"
            redirect_to root_path
        end
    end

end
