module CSG

  # Represents a 2D vector.
  class Vector2D

    property x : Float64, y : Float64

    def initialize ( x = 0, y = 0)
      @x = x.to_f
      @y = y.to_f
    end

    def clone
      Vector.new(x, y)
    end
 
    def negated
      Vector.new(-x, -y) 
    end
    
    def plus(a : Vector)
      Vector.new(x + a.x, y + a.y)
    end

    def minus(a : Vector)
      Vector.new(x - a.x, y - a.y)
    end

    def times(a : Float64)
      Vector.new(x * a, y * a)
    end
    
    def div(a : Float64)
      Vector.new(x / a, y / a)
    end

    def dot(a : Vector)
      result = x * a.x + y * a.y
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
      result = x * a.y - y * a.x
      result
    end
 
    def to_s : String
      "#{x},#{y}"
    end

    def !=(a : Vector) : Bool
      x != a.x || y != a.y 
    end

    def ==(a : Vector) : Bool
      x == a.x && y == a.y 
    end

  end
end
