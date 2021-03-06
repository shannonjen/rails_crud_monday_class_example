 class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		puts params.inspect
		@user = User.new(params[:user])
	  if @user.save
	    redirect_to user_path @user
	  else
	    redirect_to new_user_path
	  end
	end

	def edit
		puts params.inspect
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(params[:user])
		@user.save
		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy

		else

		end
		redirect_to users_path
	end
end
