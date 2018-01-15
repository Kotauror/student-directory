def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  # get the first name from the user
  name = gets.chomp
  # while the name is not empty (someone input sth), repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

# ----------------------- Exercise 1 -----------------------
# Print a number before the name of each student

def print_students_with_number(students) # with each
  students.each_with_index { |student, index|
    puts "#{(index+1)} #{student[:name]} #{student[:cohort]} cohort"
  }
end

# ----------------------- Exercise 2 -----------------------
# Print the students whose name begins with a specific letter.

def print_students_name_letter(students, letter)
  puts "Students whose names start with #{letter}:"
  students.each { |student|
    if student[:name][0] == letter then
      puts student[:name]
    end
  }
end

# ----------------------- Exercise 2 -----------------------
# Print the students whose name is shorter than a given number

def print_students_name_short(students, number)
  puts "Students whose names are shorter than #{number}:"
  students.each { |student|
    if student[:name].length < number then
      puts student[:name]
    end
  }
end


# ----------------------- Exercise 4 -----------------------
# Rewrite the each() method that prints all students using while

def print_students(students) # with while loop
  student_analyzed = 0
  while student_analyzed < students.length do
    puts "#{students[student_analyzed][:name]} #{students[student_analyzed][:cohort]} cohort"
    student_analyzed += 1
  end
end

# ----------------------- Exercise 5 -----------------------
# Our code only works with the student name and cohort.
# Add more information: hobbies, country of birth, height, etc.

def add_new_data_to_hash(students)
  students.each { |student|
    student[:hobby] = ""
    student[:country_of_birth] = ""
    student[:height] = ""
  }
end

  # example of adding a hobby to a particular student
  # people.each { |hash|
  #  if hash[:name] == "justynia" then
  #    hash[:hobby] = "kociaki"
  #  end
  #}

# ----------------------- Exercise 6 -----------------------
# Research how the method center() of the String class works.
# Use it in your code to make the output beautifully aligned.

people.each { |hash|
  puts hash[:name].center(20)
}

# ----------------------- Exercise 7 -----------------------
# In the input_students method the cohort value is hard-coded.
# How can you ask for both the name and the cohort?
# What if one of the values is empty? Can you supply a default value?
# The input will be given to you as a string? How will you convert it to a symbol?
# What if the user makes a typo?

# def input_students_two_values
#   students = []
#   puts "To finish hit return two times"
#   puts "put the name of the student"
#   name = gets.chomp.to_s
#   puts "put the cohort of the student"
#   cohort = gets.chomp.to_s
#   while !name.empty? || !cohort.empty? do
#     if name.empty? then
#       name = "Name not given".to_sym
#     end
#     if cohort.empty? then
#       cohort = "Cohort not given".to_sym
#     end
#     students << {name: name, cohort: cohort}
#     puts "Now we have #{students.count} students"
#     puts "put thename of the student"
#     name = gets.chomp.to_sym
#     puts "put the cohort of the student"
#     cohort = gets.chomp.to_sym
#   end
#   students
# end

# ----------------------- Exercise 8 -----------------------
# Once you complete the previous exercise, change the way the users are displayed:
# print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts
# (the map() method may be useful but it's not the only option),
# iterate over it and only print the students from that cohort.

cohorts = {
  november: [],
  april: [],
  june: []
}

people.each { |hash|
  if cohorts.has_key?(hash[:cohort]) then
    cohorts[hash[:cohort]].push(hash[:name])
  else
    cohorts[hash[:cohort]] = [hash[:name]] #creates list with one element
  end
}

# ----------------------- Exercise 9 -----------------------
# Right now if we have only one student, the user will see a message
# "Now we have 1 students", whereas it should be "Now we have 1 student".
# How can you fix it so that it used singular form when appropriate and plural
# form otherwise?

# def input_students_two_values
#   students = []
#   puts "To finish hit return two times"
#   puts "put the name of the student"
#   name = gets.chomp.to_s
#   puts "put the cohort of the student"
#   cohort = gets.chomp.to_s
#   while !name.empty? || !cohort.empty? do
#     if name.empty? then
#       name = "Name not given".to_sym
#     end
#     if cohort.empty? then
#       cohort = "Cohort not given".to_sym
#     end
#     students << {name: name, cohort: cohort}
#     puts "Now we have #{students.count} student#{students.count > 1 ? "s" : ""}"
#     puts "put thename of the student"
#     name = gets.chomp.to_sym
#     puts "put the cohort of the student"
#     cohort = gets.chomp.to_sym
#   end
#   students
# end

# ----------------------- Exercise 10 -----------------------
# We've been using the chomp() method to get rid of the last return character.
# RETURN - NOWA LINIA - also a character
# Find another method among those provided by the String class that could be used
# for the same purpose (although it will require passing some arguments).

# def input_students_two_values
#   students = []
#   puts "To finish hit return two times"
#   puts "put the name of the student"
#   name = gets.chomp.to_sym #chomp - removes new lines (without chomp the input will never be empty and we will never end the form)
#   puts "put the cohort of the student"
#   cohort = gets.rstrip.to_sym # rstrip - removes whitespaces and empty lines
#   while !name.empty? || !cohort.empty? do
#     if name.empty? then
#       name = "Name not given".to_sym
#     end
#     if cohort.empty? then
#       cohort = "Cohort not given".to_sym
#     end
#     students << {name: name, cohort: cohort}
#     puts "Now we have #{students.count} student#{students.count > 1 ? "s" : ""}"
#     puts "put thename of the student"
#     name = gets.chomp.to_sym
#     puts "put the cohort of the student"
#     cohort = gets.chomp.to_sym
#   end
#   students
# end

# ----------------------- Exercise 12 -----------------------
# What happens if the user doesn't enter any students?
# It will try to print an empty list. How can you use an if statement
# (Control Flow) to only print the list if there is at least one student in there?

# def input_students_two_values
#   students = []
#   puts "To finish hit return two times"
#   puts "put the name of the student"
#   name = gets.chomp.to_sym #chomp - removes new lines (without chomp the input will never be empty and we will never end the form)
#   puts "put the cohort of the student"
#   cohort = gets.rstrip.to_sym # rstrip - removes whitespaces and empty lines
#   while !name.empty? || !cohort.empty? do
#     if name.empty? then
#       name = "Name not given".to_sym
#     end
#     if cohort.empty? then
#       cohort = "Cohort not given".to_sym
#     end
#     students << {name: name, cohort: cohort}
#     puts "Now we have #{students.count} student#{students.count > 1 ? "s" : ""}"
#     puts "put thename of the student"
#     name = gets.chomp.to_sym
#     puts "put the cohort of the student"
#     cohort = gets.chomp.to_sym
#   end
#   if students.count > 0
#     return @students
#   end
# end

# ----------------------- STEP 9 - interactive menu -----------------------
# What happens if the user doesn't enter any students?
# It will try to print an empty list. How can you use an if statement
# (Control Flow) to only print the list if there is at least one student in there?


# def interactive_menu
#   students = []
#   loop do
#     puts "1. Input the students"
#     puts "2. Show the students"
#     puts "9. Exit"
#     # 2. read the input and save it into a variable
#     selection = gets.chomp
#     # 3. do what the user has asked
#     case selection
#       when "1"
#         students = input_students_two_values
#       when "2"
#         print_header
#         print_students(students)
#         print_footer(students)
#       when "9"
#         exit # this will cause the program to terminate
#       else
#         puts "I don't know what you meant, try again"
#     end
#   end
# end

# ----------------------- Refactoring of interactive menu -----------------------


@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


def print_menu
puts
puts "1. Input the students"
puts "2. Show the students"
puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students_two_values
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students_two_values
puts "To finish hit return two times"
puts "put the name of the student"
name = gets.chomp.to_sym #chomp - removes new lines (without chomp the input will never be empty and we will never end the form)
puts "put the cohort of the student"
cohort = gets.rstrip.to_sym # rstrip - removes whitespaces and empty lines
  while !name.empty? || !cohort.empty? do
    if name.empty? then
      name = "Name not given".to_sym
    end
    if cohort.empty? then
      cohort = "Cohort not given".to_sym
    end
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} student#{@students.count > 1 ? "s" : ""}"
    puts "put thename of the student"
    name = gets.chomp.to_sym
    puts "put the cohort of the student"
    cohort = gets.chomp.to_sym
  end
  if @students.count > 0
    return @students
  end
end

def show_students
print_header
print_students
print_footer
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print_students # with while loop
student_analyzed = 0
while student_analyzed < @students.length do
  puts "#{@students[student_analyzed][:name]} #{@students[student_analyzed][:cohort]} cohort"
  student_analyzed += 1
end
end

def print_footer
print "Overall, we have #{@students.length} great students"
end

interactive_menu()
