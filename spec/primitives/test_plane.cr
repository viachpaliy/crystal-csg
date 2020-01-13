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
  context "test split_polygon method" do
    it "when front polygon " do
      a = CSG::Vertex.new(CSG::Vector.new(1.0, 2.0, 3.0),CSG::Vector.new(4.0, 5.0, 6.0))
      b = CSG::Vertex.new(CSG::Vector.new(11.0, 12.0, 13.0),CSG::Vector.new(4.0, 5.0, 6.0))
      c = CSG::Vertex.new(CSG::Vector.new(21.0, 22.0, 23.0),CSG::Vector.new(4.0, 5.0, 6.0))
      p = CSG::Polygon.new([a, b, c])
      d = CSG::Plane.new(CSG::Vector.new(0.0, 0.0, 1.0),0.0)
      cf = Array(CSG::Polygon).new
      cb = Array(CSG::Polygon).new
      f = Array(CSG::Polygon).new
      bk = Array(CSG::Polygon).new
      d.split_polygon(p, cf, cb, f, bk)
      f.size.should eq(1)
      bk.size.should eq(0)
      cf.size.should eq(0)
      cb.size.should eq(0)
    end
    it "when back polygon " do
      a = CSG::Vertex.new(CSG::Vector.new(1.0, 2.0, -3.0),CSG::Vector.new(4.0, 5.0, 6.0))
      b = CSG::Vertex.new(CSG::Vector.new(11.0, 12.0, -13.0),CSG::Vector.new(4.0, 5.0, 6.0))
      c = CSG::Vertex.new(CSG::Vector.new(21.0, 22.0, -23.0),CSG::Vector.new(4.0, 5.0, 6.0))
      p = CSG::Polygon.new([a, b, c])
      d = CSG::Plane.new(CSG::Vector.new(0.0, 0.0, 1.0),0.0)
      cf = Array(CSG::Polygon).new
      cb = Array(CSG::Polygon).new
      f = Array(CSG::Polygon).new
      bk = Array(CSG::Polygon).new
      d.split_polygon(p, cf, cb, f, bk)
      f.size.should eq(0)
      bk.size.should eq(1)
      cf.size.should eq(0)
      cb.size.should eq(0)
    end
    it "when split polygon " do
      a = CSG::Vertex.new(CSG::Vector.new(1.0, 2.0, -3.0),CSG::Vector.new(4.0, 5.0, 6.0))
      b = CSG::Vertex.new(CSG::Vector.new(11.0, 12.0, 13.0),CSG::Vector.new(4.0, 5.0, 6.0))
      c = CSG::Vertex.new(CSG::Vector.new(21.0, 22.0, 23.0),CSG::Vector.new(4.0, 5.0, 6.0))
      p = CSG::Polygon.new([a, b, c])
      d = CSG::Plane.new(CSG::Vector.new(0.0, 0.0, 1.0),0.0)
      cf = Array(CSG::Polygon).new
      cb = Array(CSG::Polygon).new
      f = Array(CSG::Polygon).new
      bk = Array(CSG::Polygon).new
      d.split_polygon(p, cf, cb, f, bk)
      f.size.should eq(1)
      bk.size.should eq(1)
      cf.size.should eq(0)
      cb.size.should eq(0)
    end
  end 
end
