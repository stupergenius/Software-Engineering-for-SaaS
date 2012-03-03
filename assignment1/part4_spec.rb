load 'part4.rb'

describe Dessert do
    cake = Dessert.new "cake", 400
    flan = Dessert.new "flan", 150
    
    it ("should always be delicious") do
        cake.delicious?.should be_true
        flan.delicious?.should be_true
    end
    
    it ("should know what is healthy") do
        cake.healthy?.should be_false
        flan.healthy?.should be_true
    end
end

describe JellyBean do
    licorice = JellyBean.new "licorice jellybean", 100, "black licorice"
    orange = JellyBean.new "orange jellybean", 100, "orange"
    
    it ("should have a getter and setter for flavor") do
        orange.flavor = "not orange"
        orange.flavor.should eq "not orange"
        orange.flavor = "orange"
        orange.flavor.should eq "orange"
    end
    
    it ("should know that jellybeans are healthy") do
        orange.healthy?.should be_true
    end
    
    it ("should know that black licorice is gross") do
        licorice.delicious?.should be_false
        orange.delicious?.should be_true
    end
end
