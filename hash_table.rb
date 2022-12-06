
class HashTable
    HASH_TABLE_LEN = 103
    attr_accessor :table
    require './linked_list'

    def initialize()
        @table = Array.new(HASH_TABLE_LEN)
    end

    def hash_method(string)
        len = string.length
        hash_code = 0
        string.each_char{ |char| 
            hash_code += char.ord * (1000 ** len)
            len -=1
        }
        return hash_code % HASH_TABLE_LEN
    end

    def is_nil(value, hash_code)
        return @table[hash_code] == nil
    end


    def is_value_not_in_table(value, hash_code)
        return @table[hash_code].find(value) == -1
    end

    def push(value)
        hash_code = hash_method(value)
        if @table[hash_code] == nil
            @table[hash_code] = LinkedList.new
        end
        @table[hash_code].append(value)
    end

    def find(value)
        hash_code = hash_method(value)
        if is_nil(value, hash_code)
            return false
        end

        if is_value_not_in_table(value, hash_code)
            return false
        end
        values_idx = @table[hash_code].find(value)
        puts "#{value}의 키 값은 #{hash_code}이며 해당 키 값의 #{values_idx}번째 인덱스에 있습니다."
        return value
    end

    def delete(value)
        hash_code = hash_method(value)
        if is_nil(value, hash_code)
            return false
        end

        if is_value_not_in_table(value, hash_code)
            return false
        end

        if @table[hash_code].delete(value)
            puts "삭제가 완료되었습니다."
        else puts "삭제에 실패했습니다."
        end
    end

    def update(prev_value, new_value)
        hash_code = hash_method(prev_value)
    end
end



hash_table = HashTable.new

hash_table.push("hello")
hash_table.push("hi")
hash_table.find("hi")
puts hash_table.find("hola")
puts hash_table.delete("hola")
hash_table.delete("hi")
puts hash_table.find("hi")
hash_table.push("hello1")
hash_table.push("hi2")
hash_table.push("hello3")
hash_table.push("hi3")
hash_table.push("hello4")
hash_table.push("hi4")

hash_table.table.each.with_index {| value, idx |
    if value != nil and value.head != nil
        p idx
        value.print
    end
}
