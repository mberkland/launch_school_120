# Question 1
# Which of the following are objects in Ruby? If they are objects, how can you
# find out what class they belong to?

#1. true
#2. "hello"
#3. [1, 2, 3, "happy days"]
#4. 142

# All of the above are objects.
# To find out what class they belond to invoke the .class method on the object

p true.class
p "helo".class
p [1, 2, 3, "happy days"].class
p 142.class

# Question 2
# If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed? How can
# you check if your Car or Truck can now go fast?

# Use the include reserved word and the module name Speed in the the classes
# that you want ot have access to the Speed moduel and it's methods
# To check if a class hass access to a module invoke the ancestors method on
# the class to see the method lookup chain.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

p Car.ancestors
p Truck.ancestors

# Question 3
# In the last question we had a module called Speed which contained a go_fast
# method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end


small_car = Car.new
small_car.go_fast
# => I am a Car and going super fast!

# When we called the go_fast method from an instance of the Car class (as shown
# below) you might have noticed that the string printed when we go fast includes
# the name of the type of vehicle we are using. How is this done?

# The method go fast uses the reserved word self
# Self refers to the current object
# The method class is then invoked on the current object
# String interpolation is then used to turn the returned value of self.class
# into a string inside of the output string "I am #{} and going super fast"

# Question 4
# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# To instantiate a new object from the AngryCat class call the class method new
# on the AngryCat class

AngryCat.new

# Question 5
# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The Pizza class has an instance variable. You can tell this because instance
# variables are denoted with one @ before the name
# @name is an instance variable in teh Pizza class

# You can allso invoke the instance_variables method on an object of a class to
# see if it has any instance variables
# In the case of an object of the pizza class instance_methods shows the @name
# instance variable

joes_fruit = Fruit.new("apple")
joes_pizza = Pizza.new("pepperoni")

p joes_fruit.instance_variables
p joes_pizza.instance_variables

# Question 6
# What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# We need to add a getter method or use attr_reader or acctr_accessor to create
# a getter method

class Cube
  def initalize(volume)
    @volume = volume
  end

  def volume # getter method
    @volume
  end
end

my_cube = Cube.new("loud")
p my_cube.volume # This invokes the volume getter method on the my_cube object

# Question 7
# What is the default thing that Ruby will print to the screen if you call to_s
# on an object? Where could you go to find out if you want to be sure?

# By default the to_s method when called on an object prints the object's class
# and an encoding of the object id.
# The Ruby documentation explains this if you want to be sure

# e.g.

puts my_cube

# Question 8
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does
# self refer to here?

# self refers to the instance (object) that called the method - the calling
# object

# within instance methods self always refers to the current object

# Question 9
# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the name of the cats_count method we have used self. What does self refer
# to in this context?

# Within a class definition (but outside any instance method), Ruby sets self
# to replace the class name with self.
# self here is being used to declare a class method
# Could have also written "def Cat.cats_count" but it is common practice to use
# self instead of the class name to declare a class method definition.

# Question 10
# If we have the class below, what would you need to call to create a new
# instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# to creat a new instance of this class one must call the class method new on
# the Bag class along with 2 arguments

# E.g.
Bag.new("brown", "leather")

