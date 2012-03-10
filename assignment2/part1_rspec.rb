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
        two_rupees = one_rupee * 2
        
        puts 2.euro.in(:yen)
        
        1.dollar.in(:rupees).should eq (1/one_rupee)
        2.dollars.in(:rupees).should eq (1/two_rupees)
        2.rupees.in(:dollars).should eq two_rupees
        1.euro.in(:rupees).should eq (one_euro * one_rupee)
        2.euro.in(:yen).should eq (one_euro * 2 * one_yen)
    end
end
