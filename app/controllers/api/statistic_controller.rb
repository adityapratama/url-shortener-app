class Api::StatisticController < ApplicationController
	def vanity_statistic
		vanity_tracking = VanityTracking.select("vanity_trackings.*,vanities.vanity_url,vanities.destination_url")
			.joins(:vanity)
			.where(vanities:{vanity_url:params[:vanity]})
		
		render json:vanity_tracking
	end
end
