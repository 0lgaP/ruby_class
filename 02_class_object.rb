=begin
Create a class called MyCar. When you initialize a new instance or object of the class, 
allow the user to define some instance variables that tell us the year, color, and model of the car. 
Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. 
Create instance methods that allow the car to speed up, brake, and shut the car off.
=end

class MyCar

  #setter and reader
  #Add an accessor method to your MyCar class to change and view the color of your car. 
  #Then add an accessor method that allows you to view, but not modify, the year of your car.
  attr_accessor :color
  attr_reader :year
  attr_reader :model #or  #{@model} where we need model


  #Add a class method to your MyCar class that calculates the gas mileage of any car.
  def gas_mileage(gallons, miles)
    puts "#{miles/gallons} is the milage"
  end

  #Override the to_s method (used by puts) to create a user friendly print out of your object.
  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end

  
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  #You want to create a nice interface that allows you to accurately describe the action 
  #you want your program to perform. Create a method called spray_paint that can be called 
  #on an object and will modify the color of the car.

  def spray_paint(color)
    #use the setter method through self
    self.color = color
    puts "Ya car #{color}"
  end


  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

lumina.color = 'black'
puts lumina.color
puts lumina.year


lumina.spray_paint('red')   #=> "Your new red paint job looks great!"

MyCar.gas_mileage(13, 351)  # => "27 miles per gallon of gas"

#When running the following code...
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

#We get this error because attr_reader only creates a getter method. 
#When we try to reassign the name instance variable to "Bob", 
#we need a setter method called name=. 
#We can get this by changing attr_reader to attr_accessor or attr_writer 
#if we don't intend to use the getter functionality.

class Person
  attr_accessor :name
  # attr_writer :name ## => This also works but doesn't allow getter access
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"