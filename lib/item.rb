class Item
  attr_reader :code, :name, :price
  
  @@all = []

  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = price
    @@all<< self
  end

  def self.all
    @@all
  end
end