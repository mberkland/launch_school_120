# Question 1
# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling:

oracle = Oracle.new
oracle.predict_the_future

# "It won't pring anything because not told to print anywhere inside the code
# "You will (one of the pharases from the array in choices will be chosen
# randomly from the array in choices)"
# => "You will each a nice lunch"

# Question 2
# We have an Oracle class and a RoadTrip class that inherits from the Oracle
# class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
p trip.predict_the_future

# "It won't pring anything because not told to print anywhere inside the code
# "You will +(one of the pharases from the array in choices inisde the RoadTrip
# class will be chosen randomly from the array)
# e.g => "You will viist Vegas"

# Question 3
# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

# Invoke the ancestors class method on a class to see method lookup path for that
# class

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?
p Orange.ancestors
# => [Orange, Taste, Object, Kernel, BasicObject]

p HotSauce.ancestors
# => [HotSauce, Taste, Object, Kernel, BasicObject]

# Question 4
# What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# You could add attr_accessor and get rid of the getter and setter methods
class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# Question 5
# There are a number of variables listed below. What are the different types and
# how do you know which is which?

excited_dog = "excited dog" # local variable
@excited_dog = "excited dog" # instance variable
@@excited_dog = "excited dog" # class variable

# local variables are lower case, snake case and do not have any characters in
# the front of them
# instance variables start with one @ and are lower case and snake case
# class variables start with two @@ and are lower case and snake case

# Question 6
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would

# self.manufacturer is a class method.
# You can tell it is a class method because of the self. in the method declaration
# You can call a class method by using the class Name.class_method_name
# e.g.
Television.manufacturer

# Question 7
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

# Explain what the @@cats_count variable does and how it works. What code would
# you need to write to test your theory?

# The @@cats_count class variable keeps track of how many Cat objects are instantiated

# to demonstrate this I will instantiate a few Cat objects and then print the result
# of the cats_count class method in order to show the new vault in teh cats_count
# class variable

cat1 = Cat.new("calico")
cat2 = Cat.new("calico")
cat3 = Cat.new("tabby"
p Cat.cats_count

# Question 8
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:
class Bingo # < Game - add this so it inherits from the Game class
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from
# the Game class?

# Add a < Game to the Bingo class declaration so that it inherits from the Game
# class

# Question 9
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in
# mind that there is already a method of this name in the Game class that the
# Bingo class inherits from.

# if you add a play method to the Bingo class, whenever a play method is called
# on a Bingo object the play method inside of the Bingo object will be invoked
# This will over ride the play method inheretied from the Game class

# Question 10
# What are the benefits of using Object Oriented Programming in Ruby? Think of
# as many as you can.

# 1) Makes large code bases easier to maintain
# 2) Encapsulates functionality and makes it unavailable to the rest of the code
# base, thus data is more protected and the code base is easier to manage
# 3) Gives programmers flexibility - lets old code be used for new and different
# purposes, therefore applications can be built faster
# 4) Let's programmers think more abstractly, programs written in OOP are easer
# to conceptualize