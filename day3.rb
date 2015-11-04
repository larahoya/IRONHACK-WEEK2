require 'pry'

class Array

  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i],i)
      i += 1
    end
    self
  end

  def my_select
    return self unless block_given?
    new_array = []
    my_each {|i| new_array << i if yield(i)}
    new_array
  end

  def my_map
    i = 0
    new_array = []
    while i < self.size
      new_array << yield(self[i])
      i += 1
    end
    new_array
  end

  def my_map2(proc)
    my_array = []
    each {|i| my_array << proc.call(i)}
    my_array
  end

end


my_proc = Proc.new{|x| x*2}
[1,2,3].my_map2(my_proc)
