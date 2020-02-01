module Geo2D

  class Coordinate

    property x : Float64, y : Float64

    def initialize(x = 0, y = 0)
      @x = x.to_f
      @y = y.to_f
    end

    def initialize(coord : Coordinate)
      @x = coord.x
      @y = coord.y
    end

    def initialize(angle : Float64)
      @x = Math.cos(angle)
      @y = Math.sin(angle)
    end

    # Add two points to each other and return a new coordinate 
    def +(other : Coordinate)
      Coordinate.new x + other.x, y + other.y
    end

    # Operator + for offset addition
    def +(offset : Float64)
      Coordinate.new x + offset, y + offset
    end

    # Subtract two points from each other and return a new coordinate 
    def -(other : Coordinate)
      Coordinate.new x - other.x, y - other.y
    end

    # Operator - for offset subtract
    def -(offset : Float64)
      Coordinate.new x - offset, y - offset
    end

    # Flips the x and y of Coordinate
    def flip_xy
      Coordinate.new y, x
    end

  end 

end
