
class Lexiconomitron
  def eat_t sentence
    sentence.gsub("t", "").gsub("T", "")
  end

  def reverse_string_in_array array
    array.map {|word| word.reverse}
  end

  def first_and_last_word array
    [array.first, array.last]
  end

  def shazam array
    first_and_last_word(reverse_string_in_array(array)).map {|word| eat_t(word)}
  end

  def three_or_less array
    array.select {|word| word.size <= 3}
  end

  def oompa_loompa array
    array = three_or_less(array)
    array.map {|word| eat_t(word)}
  end
 
end

