load 'part1.rb'

describe "#palindrome" do
  it "returns true for a palindrome" do
    palindrome?("racecar").should be_true
  end
  it "returns false for a word that is not a palindrome" do
    palindrome?("foobar").should be_false
  end
  it "returns true for a palindrome with punctuation" do
    palindrome?("Madam, I'm Adam!").should be_true
  end
  it "returns true for a palindrome with cases" do
    palindrome?("A man, a plan, a canal -- Panama").should be_true
  end
end

describe "#count_words" do
  it "returns empty hash for empty string" do
    count_words("").length.should be 0
  end
  it "returns correct hash for string" do
    counts = count_words("the brown fox! Jumped ^^ over The")
    counts.length.should be 5
    counts["the"].should be 2
    counts["fox"].should be 1
    counts.has_key?("foo").should be_false
  end
end

