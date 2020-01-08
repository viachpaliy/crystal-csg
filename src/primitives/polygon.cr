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

    def clone
       _v = Array(Vertex).new
       @vertices.each do |elem|
         _v << elem.clone
       end
       Polygon.new _v
    end

    def flip
      _v = Array(Vertex).new
      @vertices.reverse_each do |elem|
        _v << elem.flip
      end
      @vertices = _v
      @plane.flip
      self
    end

  end
end
