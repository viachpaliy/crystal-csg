require "../csg"

module Geo2D

  # Class that represents a coordinate in 2D space
  class Coordinate < CSG::Vector2D

    def initialize ( x = 0, y = 0)
      super(x, y)
    end

    # flips the x and y of Coordinate
    # return Geo2D::Coordinate 
    def flip_xy
      Coordinate.new y, x
    end

    # Calculate the distance between this coordinate and another coordinate
    def distance_to(coord : Coordinate) : Float64
      self.minus(coord).length
    end

    def angle
      Math.atan2(y, x)
    end

    # Returns angle To the coordinate
    def angle_to(coord : Coordinate) : Float64
      coord.minus(self).angle
    end

    # Rotate around (0.,0.) with a given angle vector
    # return Geo2D::Coordinate
    def rotate(angle_vector : Coordinate)
      x0 = x * angleVector.x - y * angleVector.y
      y0 = x * angleVector.y + y * angleVector.x
      Coordinate.new x0, y0
    end

    # Rotate around (0.,0.) with a given angle 
    # return Geo2D::Coordinate
    def rotate(angle : Float64)
      rotate Math.cos(angle), Math.sin(angle)
    end

    # Rotate around a point with a given angle vector
    # return Geo2D::Coordinate
    def rotate(point : Coordinate, angle_vector : Coordinate)
      point.plus(self.minus(point).rotate(angle_vector))
    end

    # Rotate around a point with a given angle 
    # return Geo2D::Coordinate
    def rotate(point : Coordinate, angle : Float64)
      point.plus(self.minus(point).rotate(angle))
    end

    # Rotate around a point where the rotation described length is known 
    # return Geo2D::Coordinate
    def rotate_by_arc_length(point : Coordinate, arc_length : Float64)
      angle = arc_length / point.distance_to(self)
      rotate point, angle
    end

    # Scales the vector by given factors with 0/0 as center
    # return Geo2D::Coordinate
    def scale(scale_factor : Float64)
      self.times(scale_factor)
    end

  end

end
