load 'part5.rb'

class HistoryTest
    attr_accessor_with_history :foo
end

describe HistoryTest do
    it "should keep track of a attribute's history" do
        h1 = HistoryTest.new
        
        h1.foo_history.should be_nil
        h1.foo = 1
        h1.foo_history.should eq [nil, 1]
        h1.foo = 2
        h1.foo_history.should eq [nil, 1, 2]
        h1.foo = "three"
        h1.foo_history.should eq [nil, 1, 2, "three"]
    end
    
    it "should keep track of history separately" do
        h1 = HistoryTest.new
        h2 = HistoryTest.new
        
        h1.foo = 1
        h1.foo_history.should eq [nil, 1]
        h2.foo_history.should be_nil
        
        h2.foo = 2
        h1.foo_history.should eq [nil, 1]
        h2.foo_history.should eq [nil, 2]
    end
end
