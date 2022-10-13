#Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
    arr.select{|ele| arr.count{|el| ele == el} == 1}
end
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele, i|
        if i != arr.length-1
            if arr[i] == arr [i+1]
                return false
            end
        end
    end
    return true
end
puts
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true



def char_indices(str)
    hash = Hash.new{|h,k| h[k] = []}

    str.each_char.with_index do |char, i|
        hash[char] << i
    end

    hash
end

puts
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    hash = Hash.new{0}

    str.each_char.with_index do |char, i|
        hash[char] += 1
    end

    let = hash.key(hash.values.max)

    str.split('').select{|ele| ele == let}.join('')

end


puts
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

def prime?(n)
    return true if n == 2
    !(2...n).any?{|num| n % num == 0}
end


def bi_prime?(n)
    (2...n).each do |num1|
        (2...n).each do |num2|
            if prime?(num1) && prime?(num2) && num1 * num2 == n
                return true
                break
            end
        end
    end
    false
end


puts
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false


def vigenere_cipher(str, arr)
    alpha = 'abcdefghijklmnopqrstuvwxyz' *2
    new_str = ''

    str.each_char.with_index do |char, i|
        new_str += alpha[alpha.index(char) + arr[0]]
        arr =arr.rotate
    end

    new_str
end


puts
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"





def vowel_rotate(str)
    arr = []
    idx = []
    str.each_char.with_index do |char, i|
        if 'aeiou'.include?(char)
            arr << char
            idx << i
        end

    end
    arr = arr.rotate(-1)

    idx.each_with_index do |idx1, i|
        str[idx1] = arr[i]
    end

    str
end

puts
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"


class String

    def select(&prc)
        prc ||= Proc.new {|ele| ele == ''}
        new_char = ''

        self.each_char do |char|
            new_char += char if prc.call(char)
        end

        new_char
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
    end
end
puts
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""


puts
word_1 = "Lovelace"
word_1.map! do |ch|
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"


def multiply(a, b)
    if a > 0 && b == -1
        return -a
    end
    if b == 1 || b == -1
        return a
    end

    if b > 0
        a + multiply(a, b-1)
    elsif  (a <= 0 && b < 0)
        a.abs + multiply(a.abs, b.abs-1)
    else
        -a + multiply(a, b+1)
    end
end

puts
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    arr = []
    if num == 2
        return [2,1]
    else
        arr << (lucas_sequence(num-1)[0] + lucas_sequence(num-1)[1])
        arr
    end





    arr.unshift(lucas_sequence(num - 1)).flatten
end

puts
#p lucas_sequence(0)   # => []
#p lucas_sequence(1)   # => [2]
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(n)
    arr =[]
    if prime?(n)
        return [n]
    end

    if bi_prime?(n)
        (2...n).each do |num1|
            (2...n).each do |num2|
                if prime?(num1) && prime?(num2) && num1 * num2 == n
                    return [num1, num2]
                    break
                end
            end
        end
    end

    (2...n).each do |num1|
        (2...n).each do |num2|
        if num2 > num1
            if num1 * num2 == n && prime?(num1) && arr == []
                arr += [num1]
                arr += prime_factorization(num2)
            elsif num1 * num2 == n && prime?(num2) && arr == []
                arr += [num2]
                arr += prime_factorization(num1)
            end
        end
        end
    end

    arr.sort
end

puts
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
