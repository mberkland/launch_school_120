# Class based inheritance works great when it's used to model hierarchical
# domains. Let's take a look at a few exercises. Suppose we're building a
# software system for a pet hotel business, so our classes deal with pets.

# Exercie 1
# Given this class:

# One problem is that we need to keep track of different breeds of dogs, since
# they have slightly different behaviors. For example, bulldogs can't swim, but
# all other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method to
# return "can't swim!"

# Exercise 2
# Let's create a few more methods for our Dog class.

# Create a new class called Cat, which can do everything a dog can, except swim
# or fetch. Assume the methods do the exact same thing. Hint: don't just copy
# and paste all methods in Dog into Cat; try to come up with some class hierarchy.

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    "meow!"
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!

rosie = Bulldog.new
puts rosie.speak
puts rosie.swim

# Exercise 3
# Draw a class hierarchy diagram of the classes from step #2

# Pet: run, jump
#   Dog: speak, swim, fetch
#     Bulldog: swim
#   Cat: speak

# Exercise 4
# What is the method lookup path and how is it important?
# The method lookup path is the order in which the interpreter looks for methods
# in the class hierarchy. It's important because the method it finds first that has
# the corresponding name it's looking for will be teh method that is invoked.
# Therefore one method can override another with the same name.
# Knowing the method lookup path helps you determine which methods will be invoked
# and which will be overriden.

# To see the method lookup path
# p ClassName.ancestors

# E.g.
p Bulldog.ancestors
