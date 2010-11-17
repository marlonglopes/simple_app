class MicropostsController < ApplicationController

	before_filter :authenticate, :only => [:create, :destroy]
	before_filter :authorized_user, :only => :destroy

	def index

		if current_user

			@user=current_user
			@microposts = @user.feed.paginate(:page => params[:page], :per_page=>10)
			@feed_items = @microposts

#			respond_to do |format|
#				format.html
#				format.js
#				format.xml {render :xml=> @microposts}
#				format.json {render :json=> @microposts}
#			end
		end

	end

	def create
		@micropost = current_user.microposts.build(params[:micropost])

		respond_to do |format|
			if @micropost.save
				@feed_items = current_user.feed.paginate(:page => params[:page], :per_page=>10)
				format.html { redirect_to(root_path, :success => "Micropost created!") }
				format.js
			else
				@feed_items = current_user.feed.paginate(:page => params[:page], :per_page=>10)
				format.html { redirect_to(root_path, :error => "Can not be Blank!") }
				format.js
			end
		end

	end

	def destroy

#		@micropost.destroy
#		redirect_back_or root_path

		respond_to do |format|
			if @micropost.destroy
				@feed_items = current_user.feed.paginate(:page => params[:page], :per_page=>10)
				format.html { redirect_back_or root_path }
				format.js
			else
				@feed_items = current_user.feed.paginate(:page=> params[:page], :per_page=>10)
				format.html { redirect_to root_path }
				format.js
			end
		end
	


end

private

	def authorized_user
		@micropost = Micropost.find(params[:id])
		redirect_to root_path unless current_user?(@micropost.user)
	end


end
