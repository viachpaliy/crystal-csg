require "../../src/csg"
require "spec"

describe CSG::Plane do
  context "test methods" do
    it "when initialize with 2 args" do
      a = CSG::Plane.new(CSG::Vector.new(1.0, 2.0, 3.0),4.0)
      a.normal.x.should eq(1.0)
      a.normal.y.should eq(2.0)
      a.normal.z.should eq(3.0)
      a.w.should eq(4.0)
    end
    it "when create from points" do
      a = CSG::Vector.new(0.0, 0.0, 0.0)
      b = CSG::Vector.new(1.0, 0.0, 0.0)
      c = CSG::Vector.new(0.0, 1.0, 0.0)
      p = CSG::Plane.from_points(a, b, c)
      p.normal.x.should eq(0.0)
      p.normal.y.should eq(0.0)
      p.normal.z.should eq(1.0)
      p.w.should eq(0.0)
    end
    it "test flip method" do
      a = CSG::Plane.new(CSG::Vector.new(1.0, 2.0, 3.0),4.0)
      b = a.flip
      a.normal.x.should eq(-1.0)
      a.normal.y.should eq(-2.0)
      a.normal.z.should eq(-3.0)
      a.w.should eq(-4.0)
      b.normal.x.should eq(-1.0)
      b.normal.y.should eq(-2.0)
      b.normal.z.should eq(-3.0)
      b.w.should eq(-4.0)
    end
  end 
end
