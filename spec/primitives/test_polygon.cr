require "../../src/csg"
require "spec"

describe CSG::Polygon do
  context "test methods" do
    it "when initialize " do
      a = CSG::Vertex.new(CSG::Vector.new(1.0, 2.0, 3.0),CSG::Vector.new(4.0, 5.0, 6.0))
      b = CSG::Vertex.new(CSG::Vector.new(11.0, 12.0, 13.0),CSG::Vector.new(4.0, 5.0, 6.0))
      c = CSG::Vertex.new(CSG::Vector.new(21.0, 22.0, 23.0),CSG::Vector.new(4.0, 5.0, 6.0))
      p = CSG::Polygon.new([a, b, c])
      p.vertices[0].pos.x.should eq(1.0)
      p.vertices[1].pos.y.should eq(12.0)
      p.vertices[2].pos.z.should eq(23.0)
    end
  end
end
