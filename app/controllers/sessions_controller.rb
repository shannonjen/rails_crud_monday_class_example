class SessionsController < ApplicationController
	def new

	end

	def create
		puts params.inspect
		# binding.pry
		@user = User.where(username: params[:username]).first
		
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			redirect_to @user
		else
			render :new
		end

	end

	def destroy
     session[:user_id] = nil
     redirect_to home_path
	end
end
