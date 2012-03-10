load 'part1.rb'

describe Numeric do
    
    one_yen = 0.013
    one_euro = 1.292
    one_rupee = 0.019
    
    it "should be able to convert from dollars to yen, euros, and rupees" do
        1.yen.should eq one_yen
        1.euro.should eq one_euro
        1.rupee.should eq one_rupee
    end
    
    it "should be able to convert a singlar or plural form of currency" do
        two_yen = one_yen * 2
        two_euros = one_euro * 2
        two_rupees = one_rupee * 2
        
        2.yen.should eq two_yen
        2.euro.should eq two_euros
        2.rupee.should eq two_rupees
    end
    
    it "should be able to chain an :in message when converting" do
        1.dollar.in(:rupees).should eq (1/one_rupee)
        2.dollars.in(:rupees).should eq (2/one_rupee)
        2.rupees.in(:dollars).should eq (one_rupee * 2)
        1.euro.in(:rupees).should eq (one_euro / one_rupee)
        2.euro.in(:yen).should eq ((one_euro * 2) / one_yen)
    end
end

describe "String#palindrome?" do
    it "should create a palindrome? instance method on the String class" do
        "foo".respond_to?(:palindrome?).should be_true
    end
    
    it "should detect palindromes" do
        "racecar".palindrome?.should be_true
        "foobar".palindrome?.should be_false
    end
    
    it "should not be case sensitive" do
        "rAcEcar".palindrome?.should be_true
    end
end

describe "Enumerable#palindrome?" do
    it "should create a palindrome? instance method on the Enumerable mixin" do
        [1,2].respond_to?(:palindrome?).should be_true
    end
    
    it "should dected palindromes for enumerations" do
        [1,2,3,2,1].palindrome?.should be_true
        [1,2,3,2,2,1].palindrome?.should be_false
    end
    
    it "should not error for hashes" do
        h = {"one"=>1, "two"=>2}
        h.palindrome?.should be_false
    end
    
    it "should not care what type the enumeration encapsulates" do
        [1,"two",3.1,3.1,"two",1].palindrome?.should be_true
        [1,"two",nil,3.1,"two",1].palindrome?.should be_false
        [1,"two",nil,nil,"two",1].palindrome?.should be_true
    end
end
