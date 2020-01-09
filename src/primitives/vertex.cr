module CSG
  #  Represents a vertex of a polygon.
  class Vertex
  
    property pos : Vector, normal : Vector

    def initialize(position : Vector, normale : Vector)
      @pos = position.clone
      @normal = normale.clone
    end
 
    def clone
      Vertex.new(pos, normal)
    end

    # Invert all orientation-specific data (e.g. vertex normal). Called when the
    # orientation of a polygon is flipped.
    def flip
      @normal = @normal.negated
      self
    end

    # Create a new vertex between this vertex and `other` by linearly
    # interpolating all properties using a parameter of `t`. Subclasses should
    # override this to interpolate additional properties.
    def interpolate(other : Vertex , t : Float64)
      Vertex.new(pos.lerp(other.pos, t), normal.lerp(other.normal, t))
    end

  end
end
