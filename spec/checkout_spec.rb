require_relative '../lib/checkout'

RSpec.describe Checkout do

  subject(:checkout) { Checkout.new(promotional_rules) }

  describe '#scan' do

  end

  describe '#total' do
    it 'is 0 if the basket is empty' do
    end

    it 'applies basket discount if above £60' do
    end

    it 'applies discount for items with promotion' do
    end

    it 'applies both item and basket discount' do
    end
  end
end