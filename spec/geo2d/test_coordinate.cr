require "spec"
require "../../src/geo2d"

describe Geo2D::Coordinate do

  describe "constructor" do
    it "must create Coordinate without args" do
      a = Geo2D::Coordinate.new
      a.should be_a(Geo2D::Coordinate)  
      a.x.should eq(0.0)
      a.y.should eq(0.0)
    end
 
    it "must create Coordinate from float parameters" do
      a = Geo2D::Coordinate.new 1.234, 5.678
      a.should be_a(Geo2D::Coordinate)  
      a.x.should eq(1.234)
      a.y.should eq(5.678)
    end
    
    it "must create Coordinate from int parameters" do
      a = Geo2D::Coordinate.new 1, 5
      a.should be_a(Geo2D::Coordinate)  
      a.x.should eq(1.0)
      a.y.should eq(5.0)
    end
 
    it "must create Coordinate from another Coordinate" do
      origin_coord = Geo2D::Coordinate.new 1.234, 5.678
      a = Geo2D::Coordinate.new origin_coord
      a.should be_a(Geo2D::Coordinate)  
      a.x.should eq(1.234)
      a.y.should eq(5.678)
    end

     it "must create Coordinate from angle" do
      angle = Math::PI/6
      a = Geo2D::Coordinate.new angle
      a.should be_a(Geo2D::Coordinate)  
      a.x.should eq(Math.cos(angle))
      a.y.should eq(Math.sin(angle))
    end

  end 

  it "must add coordinates" do
    a = Geo2D::Coordinate.new 1.234, 5.678
    b = Geo2D::Coordinate.new 2.34, 6.78
    c = a + b
    c.should be_a(Geo2D::Coordinate)  
    c.x.should eq(1.234 + 2.34)
    c.y.should eq(5.678 + 6.78)
  end

  it "must offset coordinates" do
    a = Geo2D::Coordinate.new 1.234, 5.678
    b = 2.34
    c = a + b
    c.should be_a(Geo2D::Coordinate)  
    c.x.should eq(1.234 + 2.34)
    c.y.should eq(5.678 + 2.34)
  end

  it "must subtract coordinates" do
    a = Geo2D::Coordinate.new 1.234, 5.678
    b = Geo2D::Coordinate.new 2.34, 6.78
    c = a - b
    c.should be_a(Geo2D::Coordinate)  
    c.x.should eq(1.234 - 2.34)
    c.y.should eq(5.678 - 6.78)
  end

  it "must subtract offset " do
    a = Geo2D::Coordinate.new 1.234, 5.678
    b = 2.34
    c = a - b
    c.should be_a(Geo2D::Coordinate)  
    c.x.should eq(1.234 - 2.34)
    c.y.should eq(5.678 - 2.34)
  end

  
  it "must flip x and y of Coordinate" do
    origin_coord = Geo2D::Coordinate.new 1.234, 5.678
    a = origin_coord.flip_xy
    a.should be_a(Geo2D::Coordinate)  
    a.y.should eq(1.234)
    a.x.should eq(5.678)
  end 

end
