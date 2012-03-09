class String
  def palindrome?
    stripped = self.downcase.gsub(/[^a-z]/ix, '')
    return stripped == stripped.reverse
  end
end

module Enumerable
  def palindrome?
    if self.respond_to?(:reverse)
      return self.reverse == self
    else
      return false
    end
  end
end