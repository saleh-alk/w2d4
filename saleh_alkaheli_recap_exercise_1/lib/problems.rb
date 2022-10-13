# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
VOWELS ='aeiouAEIOU'

def vowels_in_word(word)
    arr = []
    word.each_char do |char|
        if VOWELS.include?(char)
            arr << char
        end
    end
    arr.uniq
end

def all_vowel_pairs(words)
    arr2 = []
    words.each_with_index do |ele1, i1|
        words.each_with_index do |ele2, i2|
            if ((vowels_in_word(ele1).sort + vowels_in_word(ele2)).uniq.sort == ['a', 'e', 'i', 'o', 'u']) && i2 > i1
                arr2 << ele1 + " " +ele2
            end
        end
    end
    arr2
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).select { |i| num % i == 0 }.length >= 1
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    arr = []
    str.split(' ').each do |ele|
        ele.each_char.with_index do |char, i|
            if i != ele.length-1
                if bigrams.include?(ele[i]+ele[i+1])
                    arr << bigrams.index(ele[i]+ele[i+1])
                end
            end
        end
    end
    arr = arr.sort
    arr.map {|ele| bigrams[ele]}
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}

    #default_p = {|k,v| k = v}
    def my_select(&prc)
        hash = {}
        prc ||= Proc.new{|h, k| h == k }  ##setting a default proc


        self.each do |h, k|
            if prc.call(h, k)
                hash[h] = k
            end
        end
        hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)

        arr = []

        if length == nil
            self.each_char.with_index do |ele, i1|
                self.each_char.with_index do |ele2, i2|
                    if i2 >= i1
                       arr << self[i1..i2]
                    end
                end
            end
        else
            self.each_char.with_index do |ele, i1|
                self.each_char.with_index do |ele2, i2|
                    if i2 >= i1 && self[i1..i2].length == length
                       arr << self[i1..i2]
                    end
                end
            end
        end
        arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ('a'..'z').to_a * 2

        self.split('').map do |char|
            alpha[alpha.index(char) + num]
        end.join('')
    end
end
