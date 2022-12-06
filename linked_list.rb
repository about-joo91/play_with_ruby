class Node
    attr_accessor :cur_value
    attr_accessor :next_node
    def initialize(value)
        @cur_value = value
        @next_node = nil
    end
end

class LinkedList
    attr_accessor :head
    @head = nil

    def append(value)
       if @head == nil
        @head = Node.new(value)
       else
        cur_node = @head
        while cur_node.next_node != nil
            cur_node = cur_node.next_node
        end
        cur_node.next_node = Node.new(value)
       end
       print
       return true
    end

    def update(value, new_value)
        cur_node = @head
        prev_node = nil

        while cur_node != nil
            if cur_node.cur_value == value
                new_node = Node.new(new_value)
                if prev_node == nil
                    @head = new_node
                else
                    prev_node.next_node = new_node
                    new_node.next_node = cur_node.next_node
                return true
                end
            end
            prev_node = cur_node
            cur_node = cur_node.next_node
        end

        if cur_node == nil
            return false
        end
    end
    
    def delete(value)
        cur_node = @head
        prev_node = nil

        while cur_node != nil
            if cur_node.cur_value == value
                if prev_node == nil
                    @head = cur_node.next_node
                else
                    prev_node.next_node = cur_node.next_node.next_node
                end
                print
                return true
            end
            prev_node = cur_node
            cur_node = cur_node.next_node
        end

        if cur_node == nil
            return false
        else
            print
        end
    end

    def find(value)
        cnt = 0
        cur_node = @head
        while cur_node != nil
            if cur_node.cur_value == value
                return cnt
            end
            cur_node = cur_node.next_node
            cnt+=1
        end
        if cur_node == nil
            return -1
        end
    end

    def print()
        cur_node = @head
        if cur_node == nil
            return -1
        end
        whole_linked_list = "#{cur_node.cur_value}"
        while cur_node.next_node != nil 
            whole_linked_list += " -> #{cur_node.next_node.cur_value}"
            cur_node = cur_node.next_node
        end
        puts whole_linked_list
    end

    def print_head()
        if @head != nil
            puts @head.cur_value
        else puts "head is nil"
        end
    end
end

linked_list = LinkedList.new

linked_list.append 1
linked_list.update 1, 2
linked_list.print_head
# linked_list.append 2
# linked_list.append 3
# linked_list.update 3, 4
# linked_list.update 3, 4
# linked_list.delete 1
# linked_list.delete 1
# linked_list.print_head
# linked_list.find 1
# linked_list.find 4
