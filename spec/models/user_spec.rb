require 'rails_helper'

describe User do
  describe '::top_average_rating' do
    it 'orders users by average item rating' do
      u = User.create(email: 'rater@a.com', password: '12345678')
      u0 = User.create(email: '0@a.com', password: '12345678')
      u1 = User.create(email: '1@a.com', password: '12345678')
      u2 = User.create(email: '2@a.com', password: '12345678')
      u0.items.create.rate 3, u, 'overall'
      u0.items.create.rate 4, u, 'overall'
      u1.items.create.rate 1, u, 'overall'
      u1.items.create.rate 5, u, 'overall'
      u2.items.create.rate 4, u, 'overall'
      expect(User.top_average_rating).to eq([u2, u0, u1])
    end
  end
end
