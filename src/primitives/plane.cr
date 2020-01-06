module CSG

  #Represents a plane in 3D space.
  class Plane
    
    property normal : Vector, w : Float64
    EPSILON = 1e-5

    def initialize(normal : Vector, w : Float64)
      @normal = normal.clone
      @w = w
    end


  end
end
