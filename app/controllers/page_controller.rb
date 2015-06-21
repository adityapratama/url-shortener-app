class PageController < ApplicationController
  require "net/http"
  include PageHelper

  def index
  	@vanity = Vanity.new
  end

  def create
  	@vanity = Vanity.new(vanity_params)
  	
    if @vanity.save
  		flash[:success] = "Create vanity #{web_name}/#{@vanity.vanity_url} has beed succeded"
  		redirect_to root_path
  	else
  		render :index
  	end
  end
  
  def vanity_redirect
    vanity = Vanity.find_by(:vanity_url => params[:vanity])
    
    ip_address = request.remote_ip
    user_agent = request.env['HTTP_USER_AGENT']
    
    vanity_tracking = VanityTracking.new({vanity:vanity,ip_address:ip_address,user_agent:user_agent})
    
    if vanity_tracking.save
      redirect_to vanity.destination_url
    else
      render json:{code:500, status:"System error"}
    end
  end
  
  def list
    @vanities = Vanity.select("vanities.*, count(vanity_trackings.id) as click")
                      .joins('left join vanity_trackings on vanity_trackings.vanity_id = vanities.id')
                      .group("vanities.id")
                      .order('vanities.id desc')
                      .page(params[:page])
  end

  private

  def vanity_params
  	params.require(:vanity).permit(:vanity_url,:destination_url)
  end
end
