# Question 1
# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1
# hello = Hello.new
# hello.hi

# a new oject named hello is created.
# "Hello" is printed - the hi method in the Hello class calls the greet method
# in the Greeting class (it's superclass)

# case 2
# hello = Hello.new
# hello.bye

# a new object named hello is created
# an undefinted mehtos error occurs for 'bye'
# This is because there is no method 'bye' in the Hello class or in the Greeting
# class it inherits from

# case 3
# hello = Hello.new
# hello.greet

# a new object named hello is created
# an ArgumentError occurs because no argument is passed to the greet method which
# requires one

# case 4
# hello = Hello.new
# hello.greet("Goodbye")

# a new object named hello is created
# Goodbye is printed after the greet method is invoked with the message "Goodbye"
# as an argument

# case 5
# Hello.hi

# an undefined method occurs
# This is because hi is an instance method not a class method and therefore must
# be called on an object not a class.

# Question 2
# In the last question we had the following classes:

class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet = Greeting.new
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?
Hello.hi

# the hi method must  become a class mehod. This requires putting
# self.method_name instead of simply method_name in the method declaration
# a new greeting object is instantiated inside of the hi method and "hello" is
# passed to it as an argument

# Question 3
# When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class,
# both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# Answer
hamburger = AngryCat.new(5, "Hamburger")
oreo = AngryCat.new(9, "Snowflake")

# Question 4

# Given the class below, if we created a new instance of the class and then
# called to_s on that instance we would get something like
# "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end

# How could we go about changing the to_s output on this method to look like
# this: I am a tabby cat? (this is assuming that "tabby" is the type we passed
# in during initialization).

# Answer: create a to_s method inside of the Cat class that overrides the regular
# to_s method

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type} cat?"
  end
end

Felix = Cat.new("tabby")
puts Felix

# Question 5
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # this will result in an error becuse manufacturer is a class
# # method. It must be called on a class not an instance of a classs (object)
tv.model

Television.manufacturer
Television.model # This will result in an error because model is an instance
# method. It must be called on an object not on a class

# Question 6
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

# In the make_one_year_older method we have used self. What is another way we
# could write this method so we don't have to use the self prefix?

# Answer:
# we culd replce self with @
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

# Question 7
# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# The return reserved word in teh information class method is not required as
# all methods in Ruby return the result of the last line of any method



