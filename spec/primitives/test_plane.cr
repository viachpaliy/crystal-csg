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
  end
end
