# Exercise 1
# Given the below usage of the Person class, code the class definition.

# Exercise 2
# Modify the class definition from above to facilitate the following methods.
# Note that there is no name= setter method now.

# Exercise 3
# Now create a smart name= method that can take just a first name or a full name,
# and knows how to set the first_name and last_name appropriately.

# Exercise 4
# Using the class definition from step #3, let's create a few more people --
# that is, Person objects.
# If we're trying to determine whether the two objects contain the same name,
# how can we compare the two objects?

# Exercise 5
# Continuing with our Person class definition, what does the below print out?

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"

# Let's add a to_s method to the class
# Now, what does the below output?

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split(" ")
    @first_name = parts[0]
    @last_name = parts.size > 1 ? parts[-1] : ' '
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# Exercise 4
p bob.name == rob.name

# Exercise 5
puts "The person's name is: #{bob}" # without the additional to_s method it puts
# a string showing the objects place in memeory