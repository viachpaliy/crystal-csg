module CSG

  #Represents a plane in 3D space.
  class Plane
    
    property normal : Vector, w : Float64
    EPSILON = 1e-5

    def initialize(normal : Vector, w : Float64)
      @normal = normal.clone
      @w = w
    end

    def self.from_points(a : Vector, b : Vector, c : Vector)
      n = b.minus(a).cross(c.minus(a)).unit
      Plane.new(n, n.dot(a))
    end 

    def flip
      @normal = @normal.negated
      @w = -@w
      self
    end

    # Split *polygon* by this plane if needed, then put the polygon or polygon
    # fragments in the appropriate arrays. Coplanar polygons go into either
    # *coplanarFront* or *coplanarBack* depending on their orientation with
    # respect to this plane. Polygons in front or in back of this plane go into
    # either *front* or *back*.



  end
end
