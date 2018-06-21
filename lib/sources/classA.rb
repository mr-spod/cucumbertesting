require 'json'

class ClassA

  attr_accessor :x
  attr_accessor :y
  attr_accessor :z

  def initialize
    @dictionary = Hash.new
    @x = -1
    @y = "Initial Value"
    @z = 'z'
  end

  def loadVals(fName)
    @dictionary = JSON.parse File.read fName
    @x = @dictionary[:x]
    @y = @dictionary[:y]
    @z = @dictionary[:z]
  end

  def printVals
    puts "x = " + @x.to_s
    puts "y = " + @y.to_s
    puts "z = " + @z.to_s
  end

end
