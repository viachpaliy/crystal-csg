module CSG

  # Represents a 3D vector.
  class Vector

    property x : Float64, y : Float64, z : Float64

    def initialize ( x = 0, y = 0, z = 0)
      @x = x.to_f
      @y = y.to_f
      @z = z.to_f
    end

    def clone
      Vector.new(x, y, z)
    end
 
    def negated
      Vector.new(-x, -y, -z) 
    end
    
    def plus(a : Vector)
      Vector.new(x + a.x, y + a.y, z + a.z)
    end

    def minus(a : Vector)
      Vector.new(x - a.x, y - a.y, z - a.z)
    end

    def times(a : Float64)
      Vector.new(x * a, y * a, z * a)
    end
    
    def div(a : Float64)
      Vector.new(x / a, y / a, z / a)
    end

    def dot(a : Vector)
      result = x * a.x + y * a.y + z * a.z
      result
    end

    def lerp(a : Vector, t : Float64)
      self.plus(a.minus(self).times(t))	
    end
   
    def length
      result = Math.sqrt(self.dot(self))
      result 
    end
  
    def unit
      self.div(self.length)
    end

    def cross(a : Vector)
      _x = y * a.z - z * a.y
      _y = z * a.x - x * a.z
      _z = x * a.y - y * a.x
      Vector.new(_x, _y, _z)
    end
 
    def to_s : String
      "#{x},#{y},#{z}"
    end

    def !=(a : Vector) : Bool
      x != a.x || y != a.y || z != a.z
    end

    def ==(a : Vector) : Bool
      x == a.x && y == a.y && z == a.z
    end

  end
end
