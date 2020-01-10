require "../../src/csg"
require "spec"

describe CSG::Node do
  context "test methods" do
    it "when initialize without args" do 
      a = CSG::Node.new
      a.should_not be_nil
      a.@plane.should be_nil
      a.@front.should be_nil
      a.@back.should be_nil
      a.@polygons.should be_a(Array(CSG::Polygon))
    end
  
    it "when invert node initialize without args" do 
      b = CSG::Node.new
      a = b.invert
      a.should_not be_nil
      a.@plane.should be_nil
      a.@front.should be_nil
      a.@back.should be_nil
      a.@polygons.should be_a(Array(CSG::Polygon))
    end
  end
  context "test clone method" do
    it "when clone node initialized without args" do
      b = CSG::Node.new
      a = b.clone
      a.should_not be_nil
      a.@plane.should be_nil
      a.@front.should be_nil
      a.@back.should be_nil
      a.@polygons.should be_a(Array(CSG::Polygon))
    end
    it "when clone node with initialized plane" do
      b = CSG::Node.new
      p = CSG::Plane.new(CSG::Vector.new(1.0, 2.0, 3.0),4.0)
      b.plane = p
      a = b.clone
      a.should_not be_nil
      a.@plane.should_not be_nil
      if p = a.@plane
        p.normal.x.should eq(1.0)
        p.normal.y.should eq(2.0)
        p.normal.z.should eq(3.0)
        p.w.should eq(4.0)
      end
      a.@front.should be_nil
      a.@back.should be_nil
      a.@polygons.should be_a(Array(CSG::Polygon))
    end 
    

  end
end
