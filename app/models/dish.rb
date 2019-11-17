# == Schema Information
#
# Table name: dishes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cuisine_id :integer
#

class Dish < ApplicationRecord
  def bookmarks
    return Bookmark.where({ :dish_id => self.id }).order({ :created_at => :asc })
  end

  def experts
    array_of_venues = self.bookmarks.pluck(:venue_id)
    return Venue.where({ :id => array_of_venues}).order({ :created_at => :asc })
  end
end
