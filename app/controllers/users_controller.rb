class UsersController < ApplicationController

	before_filter :find_user, :only => [:following, :followers, :show, :edit, :update, :destroy, :correct_user]

#	before_filter :authenticate, :only => [:index, :edit, :update]

	before_filter :correct_user, :only => [:edit, :update]
	before_filter :admin_user, :only => :destroy
	before_filter :authenticate, :except => [:show, :new, :create]


	def following
		@title = "Following"
		@users = @user.following.paginate(:page => params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@users = @user.followers.paginate(:page => params[:page])
		render 'show_follow'
	end

	def tigers

	end

	def index

		@title="All users"
		@users = User.paginate( :page => params[:page], :per_page => 10)

	end

	def new
		redirect_to users_path unless !signed_in?
		@title="Sign up"		
		@user = User.new
	end

	def edit
		@title="Edit user"
	end

	def update
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated."
			redirect_to @user
		else
			@title = "Edit user"
			render 'edit'
		end
	end

	def show
		begin	
			@microposts = @user.feed.paginate(:page => params[:page], :per_page=>10)
			@feed_items = @microposts
			@title=@user.name
		rescue
			@title="#{params[:id]} nao existe"
		end
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			@title = "Sign up"
			render 'new'
		end
	end

	def destroy
	
		if @user.destroy
			flash[:success] = "User destroyed."
			redirect_to users_path
		end
	end

private

	def authenticate
		deny_access unless signed_in?
	end

	def correct_user
		redirect_to(root_path) unless current_user?(@user)
	end

	def admin_user
		redirect_to(root_path) unless current_user.admin?
	end

protected

	def find_user
		@user=User.find(params[:id])
	end

end
