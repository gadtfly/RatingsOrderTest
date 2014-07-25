require 'rails_helper'

describe Item do
  describe '::top_average_rating' do
    it 'orders items by average rating' do
      u = User.create
      i0 = Item.create
      i1 = Item.create
      i2 = Item.create
      i0.rate 3, u, 'overall'
      i0.rate 4, u, 'overall'
      i1.rate 1, u, 'overall'
      i1.rate 5, u, 'overall'
      i2.rate 4, u, 'overall'
      expect(Item.top_average_rating).to eq([i2, i0, i1])
    end
  end
end
