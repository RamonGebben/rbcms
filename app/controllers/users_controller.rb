class UsersController < ApplicationController
    before_filter :logged_in?
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def edit
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path, :notice => "User account was created!"
        else
            render "new"
        end
    end
    
    def update
        if @user.update(user_params)
            redirect_to users_path, :notice => "User account was updated"
        else
            render action "edit"
        end
    end
    
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, :notice => "User account was destroyed"
end
    
    
    
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
    
end