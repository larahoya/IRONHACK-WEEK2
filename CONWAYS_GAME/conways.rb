class Cell

  def initialize(state,cells)
    @state = state
    @cells = cells
  end

  def alive?
    if @state == 0
      false
    else
      true
    end
  end

  def regenerate
    neighbours = @cells.reduce(0) do |sum, cell_state|
      sum += cell_state
    end
    if neighbours == 3 
      @state = 1
    else
      @state = 0
    end
  end

end