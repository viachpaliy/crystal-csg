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

  it "must multiplicate coordinates" do
    a = Geo2D::Coordinate.new 1.234, 5.678
    b = Geo2D::Coordinate.new 2.34, 6.78
    c = a * b
    c.should be_a(Geo2D::Coordinate)  
    c.x.should eq(1.234 * 2.34)
    c.y.should eq(5.678 * 6.78)
  end

  it "must multiplicate Float64" do
    a = Geo2D::Coordinate.new 1.234, 5.678
    b = 2.34
    c = a * b
    c.should be_a(Geo2D::Coordinate)  
    c.x.should eq(1.234 * 2.34)
    c.y.should eq(5.678 * 2.34)
  end

  it "must divide Float64" do
    a = Geo2D::Coordinate.new 1.234, 5.678
    b = 2.34
    c = a / b
    c.should be_a(Geo2D::Coordinate)  
    c.x.should eq(1.234 / 2.34)
    c.y.should eq(5.678 / 2.34)
  end
  
  it "must flip x and y of Coordinate" do
    origin_coord = Geo2D::Coordinate.new 1.234, 5.678
    a = origin_coord.flip_xy
    a.should be_a(Geo2D::Coordinate)  
    a.y.should eq(1.234)
    a.x.should eq(5.678)
  end 

  it "test != method" do
    a = Geo2D::Coordinate.new(1.0, 2.0)
    b = Geo2D::Coordinate.new(1.0, 2.0)
    c = Geo2D::Coordinate.new(2.0, 2.0)
    result1 = a!= b
    result2 = a!= c
    result1.should be_false
    result2.should be_true
  end

  it "test != method" do
    a = Geo2D::Coordinate.new(1.0, 2.0)
    b = Geo2D::Coordinate.new(1.0, 2.0)
    c = Geo2D::Coordinate.new(2.0, 2.0)
    result1 = a == b
    result2 = a == c
    result2.should be_false
    result1.should be_true
  end

  it "test clone method" do
    a = Geo2D::Coordinate.new(1.0, 2.0)
    b = a.clone
    b.x.should eq(1.0)
    b.y.should eq(2.0)
  end 

  it "test magnitude method" do
    a = Geo2D::Coordinate.new(3.0, 4.0)
    a.magnitude.should eq(5.0)
  end

  it "test squared method" do
    a = Geo2D::Coordinate.new(3.0, 4.0)
    a.squared.should eq(25.0)
  end

  it "test dot method" do
    a = Geo2D::Coordinate.new(1.5, 2.3)
    b = Geo2D::Coordinate.new(0.0, 1.0)
    a.dot(b).should eq(2.3)
  end

  describe "rotate method" do
    it "rotate around (0.,0.) with a given angle vector" do
      a = Geo2D::Coordinate.new(0.0, 1.0)
      b = a.rotate Geo2D::Coordinate.new(0.6, 0.8)
      b.x.should eq(-0.8)
      b.y.should eq(0.6)
    end
    it "rotate around (0.,0.) with a given angle " do
      a = Geo2D::Coordinate.new(0.0, 1.0)
      b = a.rotate 0.927295218
      b.x.should be_close(-0.8, 1e-6)
      b.y.should be_close(0.6, 1e-6)
    end
    it "rotate around a point with a given angle vector" do
      a = Geo2D::Coordinate.new(1.0, 2.0)
      b = a.rotate Geo2D::Coordinate.new(1.0, 1.0), Geo2D::Coordinate.new(0.6, 0.8)
      b.x.should be_close(0.2, 1e-6)
      b.y.should eq(1.6)
    end
    it "rotate around a point with a given angle" do
      a = Geo2D::Coordinate.new(1.0, 2.0)
      b = a.rotate Geo2D::Coordinate.new(1.0, 1.0), 0.927295218
      b.x.should be_close(0.2, 1e-6)
      b.y.should be_close(1.6, 1e-6)
    end
  end

end
