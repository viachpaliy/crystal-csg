module CSG

  # Holds a node in a BSP tree. A BSP tree is built from a collection of polygons
  # by picking a polygon to split along. That polygon (and all other coplanar
  # polygons) are added directly to that node and the other polygons are added to
  # the front and/or back subtrees. This is not a leafy BSP tree since there is
  # no distinction between internal and leaf nodes.
  class Node

    @plane : Plane | Nil
    @front : Node | Nil
    @back : Node | Nil
    @polygons : Array(Polygon)

    def initialize
      @plane = nil
      @front = nil
      @back = nil
      @polygons = Array(Polygon).new
    end

    def plane=(@plane); end

    def front=(@front); end

    def back=(@back); end
    
    def add_polygon(p : Polygon)
      @polygons << p.clone
    end 

    def clone
      node = Node.new
      node.plane = self.@plane.clone
      node.front = self.@front.clone
      node.back = self.@back.clone
      self.@polygons.each do |p|
        node.add_polygon p
      end
      node
    end

    # Convert solid space to empty space and empty space to solid space.
    def invert
      @polygons.each do |p|
        p.flip 
      end
      if pl = @plane
        pl.flip
      end
      if f = @front
        f.invert
      end
      if b = @back
        b.invert
      end  
      temp = b
      self.back = f
      self.front = temp
      self
    end


  end

end
