
def palindrome?(string)
  stripped = string.downcase.gsub(/[^a-z]/ix, '')
  return stripped == stripped.reverse
end

def count_words(string)
  counts = {}
  string.downcase.scan(/[a-z]+/ix).each {|word|
    if counts.has_key?(word)
      counts[word] = counts[word] + 1
    else
      counts[word] = 1
    end
  }
  return counts
end

