class ApplicationController < ActionController::Base
  def return_cuisine_array
    c = Cuisine.all
    render({ :plain => c.to_json})
  end

  def return_dish_array
    cuisine_id = params.fetch(:cuisine_id, "None")
    if cuisine_id == "None"
      d = Dish.all
    else
      d = Dish.where({ :cuisine_id => cuisine_id})
    end
    render({ :plain => d.to_json})
  end

  def return_dish
    d = Dish.where({ :id => params.fetch(:dish_id)}).first
    render({ :plain => d.to_json})
  end

  def return_neighborhood_array
    n = Neighborhood.all
    render({ :plain => n.to_json})
  end

  def return_venue_array
    neighborhood_id = params.fetch(:neighborhood_id, "None")
    if neighborhood_id == "None"
      v = Venue.all
    else
      v = Venue.where({ :neighborhood_id => neighborhood_id})
    end
    render({ :plain => v.to_json})
  end

  def return_user_array
    u = User.all
    render({ :plain => u.to_json})
  end

  def return_user
    u = User.where({ :id => params.fetch(:user_id)}).first
    render({ :plain => u.to_json})
  end

  def add_bookmark
    b = Bookmark.new
    b.dish_id = params.fetch(:input_dish_id)
    b.user_id = params.fetch(:input_user_id)
    b.venue_id = params.fetch(:input_venue_id)
    b.created_at = Time.now
    b.updated_at = Time.now
    b.save
    render({ :plain => b.to_json})
  end

  def return_user_bookmarks
    u = User.where({ :id => params.fetch(:user_id)}).first
    dish_id = params.fetch(:dish_id, "None")
    if dish_id == "None"
      render({ :plain => u.bookmarks.to_json})
    else
      render({ :plain => u.bookmarks.where({ :dish_id => dish_id }).to_json})
    end    
  end

  def return_venue_bookmarks
    v = Venue.where({ :id => params.fetch(:venue_id)}).first
    render({ :plain => v.bookmarks.to_json})
  end

  def remove_bookmark
    b = Bookmark.where({ :id => params.fetch(:bookmark_id)}).first
    b.destroy
    render({ :plain => b.to_json}) #returns deleted bookmark
  end

  def return_user_bookmarked_dishes
    u = User.where({ :id => params.fetch(:user_id)}).first
    render({ :plain => u.bookmarked_dishes.to_json})
  end

  def return_dish_experts
    d = Dish.where({ :id => params.fetch(:dish_id)}).first
    render({ :plain => d.experts.to_json})
  end

  def return_venue_specialties
    v = Venue.where({ :id => params.fetch(:venue_id)}).first
    render({ :plain => v.specialties.to_json})
  end
  
  def return_venue_fans
    v = Venue.where({ :id => params.fetch(:venue_id)}).first
    render({ :plain => v.fans.to_json})
  end

end
