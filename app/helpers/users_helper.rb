module UsersHelper

	def gravatar_for(user, options={:size=>50})

begin
		gravatar_image_tag(user.email.downcase, :alt => user.name,
																:class => 'gravatar',
														:gravatar => options)
rescue
end

	end

end
