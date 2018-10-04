class Item
  attr_accessor :name, :price
  @@all = []
  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end

  def find(name)
    @@all.map{|item| item.name == name}
  end 
end
