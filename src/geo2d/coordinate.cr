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

    # Calculate the distance between this coordinate and another coordinate
    def distance_to(point : Coordinate)
      (self - point).magnitude
    end

    # Angle from (0, 0) to coordinate
    def angle
      Math.atan2 y, x
    end

    # Returns angle To the coordinate
    def angle_to(point : Coordinate)
      (point - (self)).angle
    end

    # The angle between two points using the current point as the center
    def angle_between(point1 : Coordinate, point2 : Coordinate)
      v_start = point1 - self
      v_end = point2 - self
      Math.atan2(v_start.x * v_end.y - v_start.y * v_end.x, v_start.x * v_end.x + v_start.y * v_end.y)
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

    # Around a point where the rotation described length is known
    def rotate_by_arc_length(point : Coordinate, length : Float64)
      angle = length / point.distance_to(self)
      rotate(point, Coordinate.new(angle))
    end

    # Scales the coordinate by given factor with (0, 0) as center
    def scale(scale_factor : Float64)
      Coordinate.new x * scale_factor, y * scale_factor
    end

    # Scales the coordinate by given factors with (0, 0) as center
    def scale(scale_factor : Coordinate)
      Coordinate.new x * scale_factor.x, y * scale_factor.y
    end

    # Scales this coordinate by the given factors with the given center
    def scale(scale_center : Coordinate, scale_factor : Coordinate)
      scale_center + ((self - scale_center) * scale_factor)
    end

    # Midpoint between two coordinates
    def midpoint(other : Coordinate)
      (other - self)/2.0 + self
    end

    # Normalised version of this coordinate
    def norm
      m = magnitude
      Coordinate.new x / m, y / m
    end

    # Move the coordinate by distance d over vector direction
    def move(direction : Coordinate, d : Float64)
      direction.norm * d + self
    end

    # Move the coordinate in the direction of point 'to' with distance d
    def move_to(to : Coordinate, d : Float64)
      (to - self).norm * d + self
    end

    # Mirror a coordinate
    # axis1 : First point of line to be mirrored about
    # axis2 : Second point of line to be mirrored about
    def mirror(axis1 : Coordinate, axis2 : Coordinate)
      dir = axis2 - axis1
      a = dir.squared
      ret= axis1 + dir * (self- axis1).dot(dir)/a
      ret + ret - self
    end

  end 

end
