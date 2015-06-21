module PageHelper
	def web_name
		request.base_url.split("//").length > 1 ? request.base_url.split("//")[1] : "Error n	o Url found"  
	end
end
