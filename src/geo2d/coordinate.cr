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

   def clone
      Coordinate.new x, y
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

    # Multiplication two points and return a new coordinate
    def *(other : Coordinate)
      Coordinate.new x * other.x, y * other.y
    end 

    # Multiplication by Float64
    def *(s : Float64)
      Coordinate.new x * s, y * s
    end

    # Division by Float64
    def /(s : Float64)
      Coordinate.new x / s, y / s
    end

    
    def !=(coord : Coordinate) : Bool
      x != coord.x || y != coord.y 
    end

    # Checks for the equality of Coordinate
    def ==(coord : Coordinate) : Bool
      x == coord.x && y == coord.y 
    end

    # Magnitude or length of the point relative to zero
    def magnitude
      Math.sqrt(x * x + y * y)
    end

    # Squared of this Coordinate : return x * x + y * y
    def squared
      x * x + y * y
    end

    # Dot product with other coordinate : return _x * coord._x + _y * coord._y
    def dot(coord : Coordinate)
      x * coord.x + y * coord.y
    end

    # Flips the x and y of Coordinate
    def flip_xy
      Coordinate.new y, x
    end

    # Rotate around (0.,0.) with a given angle vector
    def rotate(angle_vector : Coordinate)
      x0 = x * angle_vector.x - y * angle_vector.y
      y0 = x * angle_vector.y + y * angle_vector.x
      Coordinate.new x0, y0
    end

    # Rotate around (0.,0.) with a given angle
    def rotate(angle : Float64)
      rotate(Coordinate.new(angle))
    end

    # Rotate around a point with a given angle vector
    def rotate(point : Coordinate, angle_vector : Coordinate)
      point + (self - point).rotate(angle_vector)
    end

    # Rotate around a point with a given angle 
    def rotate(point : Coordinate, angle : Float64)
      rotate(point, Coordinate.new(angle))
    end 

  end 

end
