# metaprogramming to the rescue!

class Numeric
    @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
    
    def method_missing(method_id)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end
    
    def in(currency_id)
        singular_currency = currency_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * (1/@@currencies[singular_currency])
        else
            super
        end
    end
end
