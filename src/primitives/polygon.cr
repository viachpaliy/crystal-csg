module CSG

  # Represents a convex polygon. The vertices used to initialize a polygon must
  # be coplanar and form a convex loop. 
  class Polygon

    property plane : Plane 
    property vertices : Array(Vertex) 

    def initialize(vertices )
      @vertices = vertices
      @plane = Plane.from_points(vertices[0].pos,vertices[1].pos,vertices[2].pos)
    end

  end
end
