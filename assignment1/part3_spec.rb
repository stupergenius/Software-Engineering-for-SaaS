load 'part3.rb'

describe "#combine_anagrams" do
    it "should group anagrams" do
        words =  ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
        expected = [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
        
        combine_anagrams(words).should eq(expected)
    end
    it "should ignore case but preserve for output" do
        words =  ['Creams', 'scream']
        expected = [["Creams", "scream"]]
        
        combine_anagrams(words).should eq(expected)
    end
end
