class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items
  letsrate_rater

  def self.top_average_rating
    joins(items: :overall_rates).group(:user_id).order('AVG(rates.stars) DESC')
  end
end
