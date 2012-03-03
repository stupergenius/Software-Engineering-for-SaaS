def combine_anagrams(words)
    groups = {}
    words.each {|word|
        lower_chars = []
        word.split('').each {|char|
            lower_chars.push(char.downcase)
        }
        sorted = lower_chars.sort.join
        
        if groups.has_key? sorted
            groups[sorted].push(word)
        else
            groups[sorted] = [word]
        end
    }
    return groups.values
end
