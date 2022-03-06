#A module is a collection of behaviors that is usable in other classes via mixins. 
#A module is "mixed in" to a class using the ****include****** method invocation

module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")        # => Arf!
bob = HumanBeing.new
bob.speak("Hello!")         # => Hello!


module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end
# We can use the ancestors method on any class to find out the method lookup chain.
#This means that since the speak method is not defined in the GoodDog class, the next place it looks is the Speak module. 
#This continues in an ordered, linear fashion, until the method is either found, or there are no more places to look
puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors

# 1. How do we create an object in Ruby? Give an example of the creation of an object.
class MyClass
end

my_obj = MyClass.new

# 2. What is a module? What is its purpose? How do we use them with our classes? 
# Create a module for the class you created in exercise 1 and include it properly.

# Answer A module allows us to group reusable code into one place. 
# We use modules in our classes by using the include method invocation, followed by the module name. 
# Modules are also used as a namespace.

module Swimmable
end

class Person
  include Swimmable
end

my_obj = Person.new

#Name scpacing

module Careers
  class Engineer
  end

  class Teacher
  end
end

first_job = Careers::Teacher.new