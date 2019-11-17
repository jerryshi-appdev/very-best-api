# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  def bookmarks
    return Bookmark.where({ :user_id => self.id }).order({ :created_at => :asc })
  end

  def bookmarked_dishes
    array_of_dishes = self.bookmarks.pluck(:dish_id)
    return Dish.where({ :id => array_of_dishes}).order({ :created_at => :asc }).distinct
  end
  
  def bookmarked_venues
    array_of_venues = self.bookmarks.pluck(:venue_id)

    return Venue.where({ :id => array_of_venues}).order({ :created_at => :asc }).distinct
  end

end
