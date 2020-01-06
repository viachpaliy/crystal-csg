require "../../src/csg"
require "spec"

describe CSG::Vertex do
  context "test methods" do
    it "when initialize with 2 args" do
      a = CSG::Vertex.new(CSG::Vector.new(1.0, 2.0, 3.0),CSG::Vector.new(4.0, 5.0, 6.0))
      a.pos.x.should eq(1.0)
      a.pos.y.should eq(2.0)
      a.pos.z.should eq(3.0)
      a.normal.x.should eq(4.0)
      a.normal.y.should eq(5.0)
      a.normal.z.should eq(6.0)
    end
    it "test clone method" do
      b = CSG::Vertex.new(CSG::Vector.new(1.0, 2.0, 3.0),CSG::Vector.new(4.0, 5.0, 6.0))
      a = b.clone
      a.pos.x.should eq(1.0)
      a.pos.y.should eq(2.0)
      a.pos.z.should eq(3.0)
      a.normal.x.should eq(4.0)
      a.normal.y.should eq(5.0)
      a.normal.z.should eq(6.0)
    end
    it "test flip method" do
      a = CSG::Vertex.new(CSG::Vector.new(1.0, 2.0, 3.0),CSG::Vector.new(4.0, 5.0, 6.0))
      result = a.flip
      a.normal.x.should eq(-4.0)
      a.normal.y.should eq(-5.0)
      a.normal.z.should eq(-6.0)
      result.x.should eq(-4.0)
      result.y.should eq(-5.0)
      result.z.should eq(-6.0)
    end  
    it "test interpolate method" do
      a = CSG::Vertex.new(CSG::Vector.new(1.0, 1.0, 1.0),CSG::Vector.new(2.0, 2.0, 2.0))
      b = CSG::Vertex.new(CSG::Vector.new(5.0, 5.0, 5.0),CSG::Vector.new(4.0, 4.0, 4.0))
      c = a.interpolate b, 0.5
      c.pos.x.should eq(3.0)
      c.pos.y.should eq(3.0)
      c.pos.z.should eq(3.0)
      c.normal.x.should eq(3.0)
      c.normal.y.should eq(3.0)
      c.normal.z.should eq(3.0)
    end

  end
end
