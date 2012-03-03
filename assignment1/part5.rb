class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s  # make sure it's a string
        attr_reader attr_name  # create the attribute's getter
        attr_reader attr_name+"_history" # create bar_history getter
        class_eval %{
            def #{attr_name}=(attr)
                @#{attr_name} = attr
                if @#{attr_name}_history == nil
                    @#{attr_name}_history = [nil, attr]
                else
                    @#{attr_name}_history.push(attr)
                end
            end
        }
    end
end
