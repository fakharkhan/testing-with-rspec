module ApplicationHelper
	# def page_title
	# 	"RSpec is your friend"
	# end

	def page_title
		@title || nil
	end

	def app_name
		"The App"
	end
end
