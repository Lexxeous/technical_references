# Ruby Coding Reference

# --------------------------------------------------------------------------------------------------------------
# INTRO:

# Ruby is an Object-Oriented (OO) Language

# CRUD: Create, Read, Update, Delete/Destroy

=begin
As a language, Ruby prioritizes programmer productivity over program optimization. 
This means that Ruby may not always run a program in the fastest way possible, but 
it strives to be a language that programmers find easy and fun to use (similar to Python). 
The more intuitive a language's syntax is, the more productive its users can be. 	
=end

=begin
This is the block comment syntax.
Anything inside here is greyed out.	
=end

# This is single line comment syntax.

# You can type a semicolon ';' to do an endline if you don't want to physically make one for short statements
class Dragon < Creature; end

puts # This is a output statement that prints a string and automatically ends the line (Put String).
print # This is an output statement that outputs data without an endline.

my_string = "test"
puts my_string.upcase # All letters get capitalized
puts my_string.downcase # All letters get uncapitilized
puts my_string.length # Returns the size/length of the string
puts my_string.reverse # Returns the string backwards
puts my_string.capitilize # This will capitilize the first letter in the string for format purposes
if my_string.include? "s"
  my_string.gsub!(/s/, "th") # global substitution function
# Adding a '!' to the end of a method will update/change the variable data rather than just return it
# As a general rule, Ruby methods that end with '?' will evaluate to boolean values

puts "This is the way to input a variable in a string: # {my_string}"
# Double quotes will escape characters and external input vaiables with "# {@xyz}" or "# {xyz}"
# Single quotes will not escape characters or external input variables '# {@xyz}' and '# {xyz}' will be taken literally

var1 = gets # This will prompt the user for input and set the input to var1 with endline
var2 = gets.chomp # This will "chomp" off the endline character from the "gets"
text.split(" ") # This splits a string of words into an array element whenever the "space" delimiter is reached
# Can also use other delimiters to seperate phrases ",", sentences ".", chapters "CHAPTER", etc...


100_000_000_000_000 # Ruby allows the addition of underscores every third numbers place for ease of reading large values
precision: 5, scale: 2 => -999.99 < range < +999.99
precision: 5, scale: 0 => -99_000 < range < +99_000
# precision determines the number of digits
# scale determines the number of decimal places allocated from the total number of digits

# --------------------------------------------------------------------------------------------------------------
# METHODS:

# most of the time methods that change an array, hash, etc... make a new version of the variable type instead of changing the original
# if you want to change the original, you can use the bang operator (!) on the end of certain methods ; makes a bang method

string.scan(/regex/) # returns array with all parts that match the regex ; use .size() to get the count
Regexp.union(string_array) # convert string_array into a regex

hash_base.merge(hash_pass) # combine all hash keys and values into new hash ; hash_pass new values overwrite hash_base default values
hash_base.transform_keys { |k| k.do_somthing} # change all keys in hash_base according to do_something
hash_base.transform_values { |v| v.do_somthing} # change all values in hash_base according to do_something

# --------------------------------------------------------------------------------------------------------------
# CONDITIONAL LOGIC, COMPARATIVE OPERATORS, MATHMATICAL OPERATORS, AND BOOLEAN OPERATORS:

if condition1 # Expect true by default
	statement1
elsif condition2 # or
	statement2
else			# otherwise
	statement3
end


begin
  # something which might raise an exception
rescue SomeExceptionClass => some_variable
  # code that deals with some exception
rescue SomeOtherException => some_other_variable
  # code that deals with some other exception
else
  # code that runs only if *no* exception was raised
ensure
  # ensure that this code always runs, no matter what
  # does not change the final value of the block
end


expression if boolean # One line if statements

boolean ? Do this if true : Do this if false # One line if/else

puts boolean ? "string1" : "string2"

unless condition1 # Expect false by default
	statement1
elsif condition2 # or
	statement2
else			# otherwise
	statement3
end

&& # AND
|| # OR
! # NOT

= # Assignment
== # Relational comparisons
||= # Only assign the data to this variable if it hasnt been assigned anything
!= # Not equal to
> # Greater than
>= # Greater then or equal to
< # Less then
<= # Less than or equal to
<=> # For 2 operands, returns 0 if same, returns 1 if first is greater, returns -1 if first is less

# In the order of operations, math logic comes before conditional and comparitive logic
2+2 # 4
2-2 # 0
4/4 # 1
2*3 # 6
2**16 # 65_536
3%2 # 1

+= # Add and update
-= # Subtract and update
/= # Divide and update
*= # Multiply and update

<< # Concatenation operator


# --------------------------------------------------------------------------------------------------------------
# LOOPS:

while i < 11
	statement
end

until i > 10
	statement
end

for i in 0...10
  statement # Loops 10 times, 0 through 9
end

10.times {puts "word"} # Compact way of doing a for loop

i = num
loop {
  i -= 1
  next if condition # Will skip over the current iteration if condition evaluates to true
  puts "# {i}"
  break if condition # Will break out of the loop if condition evaluates to true
  }
# Using 3 dots in a for loop (...) (an ellipses) excludes the highest value iteration
# Using 2 dots in a for loop (..) includes the highest value iteration


# --------------------------------------------------------------------------------------------------------------
# ARRAYS AND HASHES:

array.each do |var|
  var *= 10 # Does the operation to each element in the array
  puts "# {x}"
end

array.each {|var| puts var*2} # Does the same task from above on 1 line instead of 4

puts (x..y).to_a # Creates an array, x-to-y inclusive

strings = ["str1", "str2", "str3"]
symbols = []
strings.each {|s| symbols.push s.to_sym} # Pushes each element to the new array and converts the strings to symbols
# Can also use .intern in place of .to_sym to 'intern'alize the string into a symbol

array = [elem1, elem2]
array.push(elem3) # Here are ways to append values to an already existing array
array << elem4 # This is the concatenation operator and works for strings (maybe for other data types)

newArray = oldArray.collect{|elem| 2*elem} # Create a new array by doing an operation on the old elements
# Can also use the ".map" attribute in place of ".collect", it will do the same thing


odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]
ints = odds_n_ends.select{|elem| elem.is_a? Integer} # Filter out the integers in the array
puts ints # [42, 3, 19]


test_hash = { # This notation is for Ruby prior to version 1.9 (rocket notation)
  "key1" => "value1", # Ruby hashes are just like dictionaries in Python with (key,value) pairs
  "key2" => 26,
  "key3" => true # This is how you hardcode a literal hash
}

test_hash = { # This notation is for Ruby prior to version 1.9 (rocket notation) using objects instead of string keys
  :key1 => "value1", # Ruby hashes are just like dictionaries in Python with (key,value) pairs
  :key2 => 26,
  :key3 => true # This is how you hardcode a literal hash
}

new_hash = { # This notation is used for 1.9 and later (no rocket notation and colon placed on right side)
  one: 1,
  two: 2,
  three: 3
}

myHash.each_key {|key| puts key} # Iterates over only keys
myHash.each_value {|val| puts val} # iterates over only values

require 'benchmark' # Example of a require statement adding a module for the code below
string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]
string_time = Benchmark.realtime do
  100_000.times { string_AZ["r"] }
end
symbol_time = Benchmark.realtime do
  100_000.times { symbol_AZ[:r] } # Using symbol key values for hashes is faster than using string key values for hashes
end
puts "String time: # {string_time} seconds."
puts "Symbol time: # {symbol_time} seconds."


test_hash.each {|x,y| puts "# {x}: # {y}"} # Output every (key,value) pair in the hash


hash1 = Hash.new(defaultValue) # These are two ways that you can create a new/dynamic empty hash; "Hash" must be capitilized
hash2 = {}
hash2["key"] = "value" # Dynamically adding a (key,value) pair to hash2


# --------------------------------------------------------------------------------------------------------------
# CREATING A HISTOGRAM:
puts "Gimme text:"
text = gets.chomp

words = text.split

frequencies = Hash.new(0)
words.each {|word| frequencies[word] += 1}
frequencies = frequencies.sort_by {|x,y| y}
frequencies = frequencies.reverse!

frequencies.each { |name, count|
  puts name + " " + count.to_s # Converts the integer value to a string value "on the fly"
}


# --------------------------------------------------------------------------------------------------------------
# FUNCTIONS/METHODS & MODULES:

# In Ruby, the end of a function will return the last evaluated expression; implicit returns
def funcName(arg) # This is how to define functions, Ruby calls them "methods"
	statements
end

def funcName
	statements
end

# Calling functions without arguments can simply type "funcName" w/o the parenthesis
# Calling functions with arguments require using the parenthesis

super # this allows for calling the superclass/parentclass implementation of the current method

def prime(n)
  puts "That's not an integer." unless n.is_a? Integer
  is_prime = true
  for i in 2..n-1
    if n % i == 0
      is_prime = false
    end
  end
  if is_prime
    puts "# {n} is prime!"
  else
    puts "# {n} is not prime."
  end
end


def what_up(greeting, *friends)
  friends.each { |friend| puts "# {greeting}, # {friend}!" }
end
what_up("What up", "Dog", "Zoe", "Zenas", "Eleanor") # Says "What Up" to all the friends


=begin
One of the main purposes of modules is to separate methods and constants into named spaces. This is called (conveniently enough) 
namespacing, and it's how Ruby doesn't confuse Math::PI and Circle::PI. The double colon "::" is called a scope resolution operator, 
which is a way of telling Ruby where you're looking for a specific bit of code.

This is the concept that we didnt cover in C++ and why we put "using namespace std" at the top of our code after "include <iostream>" etc...

In Ruby, the include statements are changed to "require 'moduleName' " statements.
We can also "include" modules inside a class; any class that includes a certain module can use those module's methods.
When a module is used to mix additional behavior and information into a class, it's called a mixin. 
Mixins allow us to customize a class without having to rewrite code
=end
module Circle # Modules are like toolboxes than contain types of methods and constants that are similar to eachother
  PI = 3.141592653589793
  
  def Circle.area(radius)
    PI * radius**2
  end
  
  def Circle.circumference(radius)
    2 * PI * radius
  end
end


extend moduleName
=begin
Whereas "include" mixes a module's methods in at the instance level (allowing instances of a particular class to use the methods), 
the "extend" keyword mixes a module's methods at the class level. This means that class itself can use the methods, as opposed to 
instances of the class.
=end

# --------------------------------------------------------------------------------------------------------------
# SCOPES:
# keep in mind that RoR doesnt know how to use multiple "order" or "limit" clauses, so only use one of each per query
class Order < ApplicationRecord
  scope :last_n_days, ->(days) { where('updated < ?' , days) } # can take parameters
  scope :checks, -> { where(pay_type: :check) } # doesnt have to take parameters
  in_house = Order.where('email LIKE "%@pragprog.com"') # anonymous scope
end
orders = Order.last_n_days(7)
last_weeks_orders = Order.in_house.checks.last_n_days(7) # make complicated queries easier on the fly/ in the future


# --------------------------------------------------------------------------------------------------------------
# PROCS:

cube = Proc.new { |x| x ** 3 } # '&' converts the Proc into a block, like saving a small function
[1, 2, 3].collect!(&cube) # [1, 8, 27]


ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]
under_100 = Proc.new{|elem| elem < 100}
youngsters = ages.select(&under_100)
puts youngsters # [23, 7, 11, 94, 70, 44]


# --------------------------------------------------------------------------------------------------------------
# YIELDS?:

# I dont understand yields...the tutorial didnt cover them very much so im assuming they arent incredibly important
# From what I did, they almost seem like pointers...but idk...

# the method
def stuff
  puts "in method"
  yield
  puts "back in method"
  yield  
end

stuff{puts "in block"}

=begin
  in method
  in block
  back in method
  in block 
=end

# --------------------------------------------------------------------------------------------------------------
# LAMBDAS:

=begin
Lambdas are "pretty much" the same thing as Procs
There are two main differences between lambdas and Procs:
  1. A lambda checks the number of arguments passed to it, while a proc does not. 
      This means that a lambda will throw an error if you pass it the wrong number of arguments, 
      whereas a proc will ignore unexpected arguments and assign nil to any that are missing.

  2. When a lambda returns, it passes control back to the calling method; when a proc returns, 
      it does so immediately, without going back to the calling method.
=end
lambda { |param| block }

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda {|param| param.to_sym}
symbols = strings.collect(&symbolize)
print symbols # [:leonardo, :donatello, :raphael, :michaelangelo]


my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda{|param| param.is_a? Symbol}
symbols = my_array.select(&symbol_filter)
puts symbols # [:kettles, :mittens, :packages]


# --------------------------------------------------------------------------------------------------------------
# CLASSES:

$ # This prefix marks a variable as global
@ # This prefix marks a variable for a particular instance (instance variable)
@@ # This prefix marks a variable for a particular class (class variable)

attr_reader :var1 # Allows an object attribute of a particular class to be read but not written/changed
attr_writer :var2 # Allows an object attribute of a particular class to be written/changed but not read
attr_accessor :var3 # Allows an object attribute of a particular class to be read and written/changed
attribute :symbol # From ActiveAttr

public # This makes the method accessable by others/public
private # This makes the method accessable by only the programmer (you)
def funcName # By adding one of these two keywords above a function definition, well ya know...

class DerivedClass < BaseClass # This is how to create and inheritance class (subclass)
  # Defining methods (public and/or pubic)
end # Defining functions inside inherited classe can/will override functions from the base class of the same name


class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end
class Dragon < Creature
  def fight
    puts "Instead of breathing fire..."
    super # The super keyword is the only thing that keeps the "Dragon" class from overriding the "Creature" class
  end
end


class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end
  
  def description
    puts "I'm # {@name} and I was created by # {@creator}!"
  end
end
ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")
ruby.description
python.description
javascript.description
=begin
I'm Ruby and I was created by Yukihiro Matsumoto!
I'm Python and I was created by Guido van Rossum!
I'm JavaScript and I was created by Brendan Eich!
=end



class Machine
  @@users = {}
  
  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end
  
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "# {filename} was created by # {@username} at # {time}."
  end
  
  def Machine.get_users
    @@users
  end
end
my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)
my_machine.create("groceries.txt")
your_machine.create("todo.txt")


# --------------------------------------------------------------------------------------------------------------
# MISCELLANEOUS:

Integer() # Requires that a variable of type "integer" be inputted
Float() # 
num.floor # This will round the "num" down to the closest integer

# Where C++ has NULL, Ruby has Nil.

list.sort! {|first,second| first<=>second} # Sort in forward/ascending order, or could just not use the block notation
list.sort! {|first,second| second<=>first} # Sort in reverse/descending order

var1.upto(var2) {|var| puts var} # Can do a range of values like a for loop for numbers, strings, etc...
var2.downto(var1) {|var| puts var}

variable.respond_to?(:attribute) # Returns true if the "variable" can be manipulated by the "attribute", false otherwise


# --------------------------------------------------------------------------------------------------------------
# CASE STATEMENT EXAMPLE:

movies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}

puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp.downcase
case choice
when 'add'
  puts "What movie do you want to add?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What's the rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "# {title} has been added with a rating of # {rating}."
  else
    puts "That movie already exists! Its rating is # {movies[title.to_sym]}."
  end
when 'update'
  puts "What movie do you want to update?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the new rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "# {title} has been updated with new rating of # {rating}."
  end
when 'display'
  movies.each do |movie, rating|
    puts "# {movie}: # {rating}"
  end
when 'delete'
  puts "What movie do you want to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    movies.delete(title.to_sym)
    puts "# {title} has been removed."
  end
else
  puts "Sorry, I didn't understand you."
end


# --------------------------------------------------------------------------------------------------------------
# LAST EXAMPLE:

class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end
  
  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $# {@balance}." : pin_error
  end
  
  def withdraw(pin_number, amount)
    if pin_number == pin
      @balance -= amount
      puts "Withdrew # {amount}. New balance: $# {@balance}."
    else
      puts pin_error
    end
  end
  
  private
  
  def pin
    @pin = 1234
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end
end

my_account = Account.new("Eric", 1_000_000)
my_account.withdraw(11, 500_000)
my_account.display_balance(1234)
my_account.withdraw(1234, 500_000)
my_account.display_balance(1234)


# --------------------------------------------------------------------------------------------------------------


