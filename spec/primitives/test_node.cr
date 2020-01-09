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
    it "when clone node initialized without args" do
      b = CSG::Node.new
      a = b.clone
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
end
