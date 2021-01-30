class User < ApplicationRecord
  has_many :tours
  has_many :views

  def self.get_live_anaytics
    user_count = User.all.count
    total_tours = Tour.all.count
    total_user_views = View.where("user_id is not null").count
    total_tour_views = View.where("tour_id is not null").count
    total_point_views = View.where("point_id is not null").count
    total_point_visits = Visit.where("point_id is not null").count
    all_views = View.all
    user_views_hash = {}
    tour_views_hash = {}
    all_views.each do |view|
      user_views_hash[view.user_id] = user_views_hash[view.user_id].to_i + 1 if view.user_id.present?
      tour_views_hash[view.tour_id] = tour_views_hash[view.tour_id].to_i + 1 if view.tour_id.present?
    end
    view_tour = self.largest_hash_key(tour_views_hash)
    view_user = self.largest_hash_key(user_views_hash)
    max_view_user = view_user.present? ? User.where(id: view_user[0]).first.name : User.first.name
    max_view_tour = view_tour.present? ? Tour.where(id: view_tour[0]).first.name : Tour.first.name
    view = View.last
    location = "#{view.latitude}, #{view.longitude}"
    analytics_hash = {total_users: user_count, total_tours: total_tours, total_user_views: total_user_views, total_tour_views: total_tour_views, total_point_views: total_point_views, total_point_visits: total_point_visits, max_view_tour: max_view_tour, max_view_user: max_view_user, location: location}
    analytics_hash
  end

  def self.largest_hash_key(hash)
    hash.max_by{|k,v| v}
  end
end
