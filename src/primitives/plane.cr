module CSG

  #Represents a plane in 3D space.
  class Plane
    
    property normal : Vector, w : Float64
    EPSILON = 1e-5
    COPLANAR = 0
    FRONT = 1
    BACK = 2
    SPANNING = 3

    def initialize(normal : Vector, w : Float64)
      @normal = normal.clone
      @w = w
    end

    def clone
      Plane.new(@normal, @w)
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

    def split_polygon(polygon : Polygon , coplanarFront : Array(Polygon), coplanarBack : Array(Polygon), front : Array(Polygon), back : Array(Polygon))
 
      # Classify each point as well as the entire polygon into one of the above
      # four classes.
      polygonType = 0
      types = Array(Int32).new
      polygon.vertices.each do |vert|
        t = @normal.dot(vert.pos) - @w
        type = (t < -EPSILON) ? BACK : (t > EPSILON) ? FRONT : COPLANAR
        polygonType |= type
        types << type
      end

      # Put the polygon in the correct list, splitting it when necessary.
      case polygonType
        when COPLANAR
          @normal.dot(polygon.plane.normal) > 0 ? coplanarFront << polygon : coplanarBack << polygon
        when FRONT
          front << polygon
        when BACK
          back << polygon
        when SPANNING
          f = Array(Vertex).new
          b = Array(Vertex).new
          (0..polygon.vertices.size).each do |i| 
            j = Int32.new((i + 1) % polygon.vertices.size)
            ti = types[i]
            tj = types[j]
            vi = polygon.vertices[i]
            vj = polygon.vertices[j]
            f << vi if (ti != BACK)
            if (ti != FRONT)
                ti != BACK ? b << vi.clone : b << vi
            end
            if ((ti | tj) == SPANNING)
              t = (@w - @normal.dot(vi.pos)) / @normal.dot(vj.pos.minus(vi.pos))
              v = vi.interpolate(vj, t)
              f << v
              b << v.clone
            end
          end
          front << Polygon.new(f) if f.size >= 3
          back << Polygon.new(b) if b.size >= 3
        end                     
      end

    end
  end



