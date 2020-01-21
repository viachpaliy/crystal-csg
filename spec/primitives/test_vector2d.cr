require "../../src/csg"
require "spec"

describe CSG::Vector2D do
  context "test_initialize" do
   
    it "when initialize with 2 args" do
      a = CSG::Vector2D.new(1.5, 2.3)
      a.x.should eq(1.5)
      a.y.should eq(2.3)
    end
 
    it "when initialize with 1 arg" do
      a = CSG::Vector2D.new(2.1)
      a.x.should eq(2.1)
      a.y.should eq(0.0)
    end

    it "when initialize without args" do
      a = CSG::Vector2D.new
      a.x.should eq(0.0)
      a.y.should eq(0.0)
    end
  end
  
  context "test methods" do
    it "test negated method" do
      b = CSG::Vector2D.new(1.5, 2.3)
      a = b.negated 
      a.x.should eq(-1.5)
      a.y.should eq(-2.3)
    end
    it "test plus method" do
      a = CSG::Vector2D.new(1.5, 2.3)
      b = CSG::Vector2D.new(5.6, 6.7)
      c = a.plus b
      c.x.should eq(1.5 + 5.6)
      c.y.should eq(2.3 + 6.7)
    end
    it "test minus method" do
      a = CSG::Vector2D.new(1.5, 2.3)
      b = CSG::Vector2D.new(5.6, 6.7)
      c = a.minus b
      c.x.should eq(1.5 - 5.6)
      c.y.should eq(2.3 - 6.7)
    end
    it "test times method" do
      a = CSG::Vector2D.new(1.5, 2.3)
      b = a.times(5.6)
      b.x.should eq(1.5 * 5.6)
      b.y.should eq(2.3 * 5.6)
    end
    it "test div method" do
      a = CSG::Vector2D.new(1.5, 2.3)
      b = a.div(5.6)
      b.x.should eq(1.5 / 5.6)
      b.y.should eq(2.3 / 5.6)   
    end

    it "test dot method" do
      a = CSG::Vector2D.new(1.5, 2.3)
      b = CSG::Vector2D.new(0.0, 1.0)
      result = a.dot b
      result.should eq(2.3)
    end
    it "test length method" do
      a = CSG::Vector2D.new(3.0, 4.0)
      result = a.length
      result.should eq(5.0)
    end
    it "test unit method" do
      a = CSG::Vector2D.new(3.0, 4.0)
      b = a.unit
      b.x.should eq(0.6)
      b.y.should eq(0.8)
    end
    it "test cross method" do
      a = CSG::Vector2D.new(1.0, 2.0)
      b = CSG::Vector2D.new(4.0, 5.0)
      c = a.cross b
      c.should eq(1.0 * 5.0 - 2.0 * 4.0)
    end
    it "test to_s method" do
      a = CSG::Vector2D.new(1.0, 2.0)
      result = a.to_s
      result.should be_a(String) 
    end
    it "test != method" do
      a = CSG::Vector2D.new(1.0, 2.0)
      b = CSG::Vector2D.new(1.0, 2.0)
      c = CSG::Vector2D.new(2.0, 2.0)
      result1 = a!= b
      result2 = a!= c
      result1.should be_false
      result2.should be_true
    end
    it "test == method" do
      a = CSG::Vector2D.new(1.0, 2.0)
      b = CSG::Vector2D.new(1.0, 2.0)
      c = CSG::Vector2D.new(2.0, 2.0)
      result1 = a== b
      result2 = a== c
      result2.should be_false
      result1.should be_true
    end
    it "test clone method" do
      a = CSG::Vector2D.new(1.0, 2.0)
      b = a.clone
      b.x.should eq(1.0)
      b.y.should eq(2.0)
    end 

  end
  

  
end
