class Vanity < ActiveRecord::Base
	has_many :vanity_tracking
	
	paginates_per 10
	
	after_validation :smart_vanity_url_protocol
	
	validates :vanity_url, presence:true, length: {maximum:50}, uniqueness:true
	validates :destination_url, presence:true, length: {maximum:255}
	
	protected
	
	def smart_vanity_url_protocol
	  unless self.destination_url[/\Ahttp:\/\//] || self.destination_url[/\Ahttps:\/\//]
	    self.destination_url = "http://#{self.destination_url}"
	  end
	end
end
