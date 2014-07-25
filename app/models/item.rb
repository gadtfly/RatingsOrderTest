class Item < ActiveRecord::Base
  belongs_to :user
  letsrate_rateable 'overall'

  def self.top_average_rating
    joins(:overall_rates).group(:rateable_id).order('AVG(rates.stars) DESC')
  end
end
