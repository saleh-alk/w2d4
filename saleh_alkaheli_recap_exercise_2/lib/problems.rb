# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)

    multiple = [num_1,num_2].max

    until multiple % num_1 == 0 && multiple % num_2 == 0
        multiple += 1
    end

    multiple

end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)

    str.each_char.with_index do |char1, i1|
        str.each_char.with_index do |char2, i2|
            if i2 == i1+1
                hash[str[i1..i2]] += 1
            end
        end
    end

    hash.key(hash.values.max)

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = {}
        self.each do |k, v|
            hash[v] = k
        end
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |num1, i1|
            self.each_with_index do |num2, i2|
                if i2 > i1 && self[i1] + self[i2] == num
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)


        prc ||= Proc.new{|b, a| b <=> a}


        10.times do
        self.each.with_index do |ele, i|
            if i != self.length-1
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                end
            end
        end
    end
        self
    end

end

p [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort()
p [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort() { |b, a| b.to_s <=> a.to_s }
