class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
        @books = @user.books
	  	@book = Book.new
  	end
	def edit
		@user = User.find(params[:id])
		if current_user.id != @user.id
			redirect_to user_path(current_user.id)
		end
	end
	def update
		@user = User.find(params[:id])
    	if @user.update(user_params)
    		redirect_to user_path(@user.id)
    		flash[:notice] = "You have updated user successfully."
    	else
    		render 'users/edit'
    	end
	end
	def index
		@users = User.all
		@user = User.find_by(id: current_user.id)
		@book = Book.new
	end
	private
	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end
	def update_resource(resource, params)
	    resource.update_without_password(params)
	end

end
