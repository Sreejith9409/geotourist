class DashboardController < ApplicationController
  def index
    @analytics_hash = User.get_live_anaytics
    @users = User.last(5)
    @tours = Tour.includes(:user).last(5)
  end

  def get_analytics_data
    analytics_hash = User.get_live_anaytics
    render :json => analytics_hash.to_json
  end
end
