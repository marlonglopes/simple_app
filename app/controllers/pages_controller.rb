class PagesController < ApplicationController

#TODO todo
#FIXME fixme

#OPTIMIZE optmize

#	def home
#		@title="Home"
#		@micropost = Micropost.new if signed_in?
#	end

	def home
		@title = "Home"
		if signed_in?
			@micropost = Micropost.new
			@feed_items = current_user.feed.paginate(:page => params[:page], :per_page=>10)
		end
	end


	def contact
		@title="Contact"
	end

	def about
		@title="About"
	end

	def help
		@title="Help"
	end

end
