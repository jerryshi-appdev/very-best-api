# == Schema Information
#
# Table name: venues
#
#  id              :integer          not null, primary key
#  address         :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#

class Venue < ApplicationRecord
  def bookmarks
    return Bookmark.where({ :venue_id => self.id }).order({ :created_at => :asc })
  end

  def specialties
    array_of_dishes = self.bookmarks.pluck(:dish_id)
    return Dish.where({ :id => array_of_dishes }).order({ :created_at => :asc }).distinct
  end

  def fans
    array_of_users = self.bookmarks.pluck(:user_id)
    return User.where({ :id => array_of_users }).order({ :created_at => :asc }).distinct
  end
end
