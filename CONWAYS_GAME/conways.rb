require 'pry'
require 'RSpec'
require 'rack/test'

class Cell

  attr_reader :state

  def initialize(state,cells)
    @state = state
    @cells = cells
  end

  def alive?
    @state == 1 ? true : false
  end

  def live_neighbours
    @cells.reduce(0) {|sum, cell| sum += cell}
  end

  def regenerate
    if !alive? && live_neighbours == 3
      @state = 1
    elsif alive? && (live_neighbours < 2 || live_neighbours > 3)
      @state = 0
    end
  end

end
