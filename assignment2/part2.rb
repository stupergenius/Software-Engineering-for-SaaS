class CartesianProduct
  include Enumerable
  
  def initialize(enum_a, enum_b)
    @enum_a = enum_a
    @enum_b = enum_b
  end
  
  def each
    @enum_a.each do |item_a|
      @enum_b.each do |item_b|
        yield [item_a, item_b]
      end
    end
  end
end