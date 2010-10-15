class UsersController < ApplicationController

	def new
		@title="Sign up"
		@user = User.create
	end

	def show
		begin	
			@user = User.find(params[:id])
			@title=@user.name
		rescue
			@title="#{params[:id]} não existe"
		end
	end
end
