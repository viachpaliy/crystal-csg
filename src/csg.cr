require "./primitives"

module CSG
        # Constructive Solid Geometry (CSG) is a modeling technique that uses Boolean
        # operations like union and intersection to combine 3D solids. This library
        # implements CSG operations on meshes elegantly and concisely using BSP trees,
        # and is meant to serve as an easily understandable implementation of the
        # algorithm. All edge cases involving overlapping coplanar polygons in both
        # solids are correctly handled.
        # Two solids can be combined using the #union(), #subtract(), and #intersect() methods.
        # Example usage:
        # ```
        #     cube = CSG.cube()
        #     sphere = CSG.sphere( radius: 1.3 )
        #     polygons = CSG.subtract(cube, sphere)
        # ```
        # Implementation Details
        # 
        # All CSG operations are implemented in terms of two functions, #clip_to() and
        #  #invert(), which remove parts of a BSP tree inside another BSP tree and swap
        # solid and empty space, respectively. To find the union of `a` and `b`, we
        # want to remove everything in `a` inside `b` and everything in `b` inside `a`,
        # then combine polygons from `a` and `b` into one solid:
        # 
        #     a.clip_to(b);
        #     b.clip_to(a);
        #     a.build(b.all_polygons());
        # 
        # The only tricky part is handling overlapping coplanar polygons in both trees.
        # The code above keeps both copies, but we need to keep them in one tree and
        # remove them in the other tree. To remove them from `b` we can clip the
        # inverse of `b` against `a`. The code for union now looks like this:
        # 
        #     a.clip_to(b);
        #     b.clip_to(a);
        #     b.invert();
        #     b.clip_to(a);
        #     b.invert();
        #     a.build(b.all_polygons());
        # 
        # Subtraction and intersection naturally follow from set operations. If
        # union is `A | B`, subtraction is `A - B = ~(~A | B)` and intersection is
        # `A & B = ~(~A | ~B)` where `~` is the complement operator.


        # Return an array of polygons representing space in either the solid `A` or in the
        # solid `B`. Neither the solid `A` nor the solid `B` are modified.
        # 
        #     CSG.union(A,B)
        # 
        #     +-------+            +-------+
        #     |       |            |       |
        #     |   A   |            |       |
        #     |    +--+----+   =   |       +----+
        #     +----+--+    |       +----+       |
        #          |   B   |            |       |
        #          |       |            |       |
        #          +-------+            +-------+
        # 
        def self.union(pa : Array(Polygon), pb : Array(Polygon))
          a = Node.new pa
          b = Node.new pb
          a.clip_to(b) 
          b.clip_to(a)
          b.invert 
          b.clip_to(a) 
          b.invert 
          a.build(b.all_polygons) 
          a.all_polygons
        end

        # Return an array of polygons representing space in the solid `A` but not in the
        # solid `B`. Neither this solid nor the solid `B` are modified.
        # 
        #     CSG.subtract(A, B)
        # 
        #     +-------+            +-------+
        #     |       |            |       |
        #     |   A   |            |       |
        #     |    +--+----+   =   |    +--+
        #     +----+--+    |       +----+
        #          |   B   |
        #          |       |
        #          +-------+
        # 
        def self.subtract(pa : Array(Polygon), pb : Array(Polygon))
          a = Node.new pa
          b = Node.new pb
          a.invert
          a.clip_to(b)
          b.clip_to(a)
          b.invert
          b.clip_to(a)
          b.invert
          a.build(b.all_polygons)
          a.invert
          a.all_polygons
        end   

        # Return an array of polygons representing space both the solid `A` and in the
        # solid `B`. Neither this solid nor the solid `B` are modified.
        # 
        #     CSG.intersect(A, B)
        # 
        #     +-------+
        #     |       |
        #     |   A   |
        #     |    +--+----+   =   +--+
        #     +----+--+    |       +--+
        #          |   B   |
        #          |       |
        #          +-------+
        # 
        def self.intersect(pa : Array(Polygon), pb : Array(Polygon))
          a = Node.new pa
          b = Node.new pb
          a.invert()
          b.clip_to(a)
          b.invert
          a.clip_to(b)
          b.clip_to(a)
          a.build(b.all_polygons)
          a.invert
          a.all_polygons
        end   

        # Return an array of polygons with solid and empty space switched.
        def  self.inverse(pa : Array(Polygon))
          csg = Array(Polygon).new
          pa.each do |p|
            csg << p.clone.flip
          end
          csg
        end


end
