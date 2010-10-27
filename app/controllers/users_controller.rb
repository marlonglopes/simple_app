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
			redirect_to user_path @puser, :notice => 'User was successfully created.'
#	      format.html { redirect_to(@puser, :notice => 'User was successfully created.') }
#			format.xml  { render :xml => @user, :status => :created, :location => @user }
		else
			@title = "Sign up"
			render 'new'
#			format.html { render :action => "new" }
#			format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }

		end
	end


end
