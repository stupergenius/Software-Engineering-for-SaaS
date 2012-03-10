load 'part2.rb'

describe CartesianProduct do
    
    it "should create a cartesian product" do
        c = CartesianProduct.new([:a,:b], [4,5])
        product = []
        c.each { |t| product.push t }
        
        product.length.should eq 4
        product.include?([:a, 4]).should be_true
        product.include?([:a, 5]).should be_true
        product.include?([:b, 4]).should be_true
        product.include?([:b, 5]).should be_true
    end
    
    it "should yield nothing when one set is empty" do
        c = CartesianProduct.new([:a,:b], [])
        product = []
        c.each { |t| product.push t }
        product.length.should eq 0
        
        c = CartesianProduct.new([], [4, 5])
        product = []
        c.each { |t| product.push t }
        product.length.should eq 0
    end
end
