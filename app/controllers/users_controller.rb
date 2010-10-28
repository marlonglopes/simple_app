class UsersController < ApplicationController

	def new
		@user = User.new
		@title="Sign up"
	end

	def show
		begin	
			@user = User.find(params[:id])
			@title=@user.name
		rescue
			@title="#{params[:id]} não existe"
		end
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			@title = "Sign up"
			render 'new'
		end
	end


end
