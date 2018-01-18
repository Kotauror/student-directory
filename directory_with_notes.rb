# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   students = []
#   # get the first name from the user
#   name = gets.chomp
#   # while the name is not empty (someone input sth), repeat this code
#   while !name.empty? do
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     # get another name from the user
#     name = gets.chomp
#   end
#   students
# end
#
# def print_header
#   puts "The students of Villains Academy"
#   puts "-------------"
# end
#
# def print_footer(names)
#   print "Overall, we have #{names.count} great students"
# end
#
# # ----------------------- Exercise 1 -----------------------
# # Print a number before the name of each student
#
# def print_students_with_number(students) # with each
#   students.each_with_index { |student, index|
#     puts "#{(index+1)} #{student[:name]} #{student[:cohort]} cohort"
#   }
# end
#
# # ----------------------- Exercise 2 -----------------------
# # Print the students whose name begins with a specific letter.
#
# def print_students_name_letter(students, letter)
#   puts "Students whose names start with #{letter}:"
#   students.each { |student|
#     if student[:name][0] == letter then
#       puts student[:name]
#     end
#   }
# end
#
# # ----------------------- Exercise 2 -----------------------
# # Print the students whose name is shorter than a given number
#
# def print_students_name_short(students, number)
#   puts "Students whose names are shorter than #{number}:"
#   students.each { |student|
#     if student[:name].length < number then
#       puts student[:name]
#     end
#   }
# end
#
#
# # ----------------------- Exercise 4 -----------------------
# # Rewrite the each() method that prints all students using while
#
# def print_students(students) # with while loop
#   student_analyzed = 0
#   while student_analyzed < students.length do
#     puts "#{students[student_analyzed][:name]} #{students[student_analyzed][:cohort]} cohort"
#     student_analyzed += 1
#   end
# end
#
# # ----------------------- Exercise 5 -----------------------
# # Our code only works with the student name and cohort.
# # Add more information: hobbies, country of birth, height, etc.
#
# def add_new_data_to_hash(students)
#   students.each { |student|
#     student[:hobby] = ""
#     student[:country_of_birth] = ""
#     student[:height] = ""
#   }
# end
#
#   # example of adding a hobby to a particular student
#   # people.each { |hash|
#   #  if hash[:name] == "justynia" then
#   #    hash[:hobby] = "kociaki"
#   #  end
#   #}
#
# # ----------------------- Exercise 6 -----------------------
# # Research how the method center() of the String class works.
# # Use it in your code to make the output beautifully aligned.
#
# # people.each { |hash|
# #   puts hash[:name].center(20)
# # }
#
# # ----------------------- Exercise 7 -----------------------
# # In the input_students method the cohort value is hard-coded.
# # How can you ask for both the name and the cohort?
# # What if one of the values is empty? Can you supply a default value?
# # The input will be given to you as a string? How will you convert it to a symbol?
# # What if the user makes a typo?
#
# # def input_students_two_values
# #   students = []
# #   puts "To finish hit return two times"
# #   puts "put the name of the student"
# #   name = gets.chomp.to_s
# #   puts "put the cohort of the student"
# #   cohort = gets.chomp.to_s
# #   while !name.empty? || !cohort.empty? do
# #     if name.empty? then
# #       name = "Name not given".to_sym
# #     end
# #     if cohort.empty? then
# #       cohort = "Cohort not given".to_sym
# #     end
# #     students << {name: name, cohort: cohort}
# #     puts "Now we have #{students.count} students"
# #     puts "put thename of the student"
# #     name = gets.chomp.to_sym
# #     puts "put the cohort of the student"
# #     cohort = gets.chomp.to_sym
# #   end
# #   students
# # end
#
# # ----------------------- Exercise 8 -----------------------
# # Once you complete the previous exercise, change the way the users are displayed:
# # print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts
# # (the map() method may be useful but it's not the only option),
# # iterate over it and only print the students from that cohort.
#
# # cohorts = {
# #   november: [],
# #   april: [],
# #   june: []
# # }
# #
# # people.each { |hash|
# #   if cohorts.has_key?(hash[:cohort]) then
# #     cohorts[hash[:cohort]].push(hash[:name])
# #   else
# #     cohorts[hash[:cohort]] = [hash[:name]] #creates list with one element
# #   end
# # }
#
# # ----------------------- Exercise 9 -----------------------
# # Right now if we have only one student, the user will see a message
# # "Now we have 1 students", whereas it should be "Now we have 1 student".
# # How can you fix it so that it used singular form when appropriate and plural
# # form otherwise?
#
# # def input_students_two_values
# #   students = []
# #   puts "To finish hit return two times"
# #   puts "put the name of the student"
# #   name = gets.chomp.to_s
# #   puts "put the cohort of the student"
# #   cohort = gets.chomp.to_s
# #   while !name.empty? || !cohort.empty? do
# #     if name.empty? then
# #       name = "Name not given".to_sym
# #     end
# #     if cohort.empty? then
# #       cohort = "Cohort not given".to_sym
# #     end
# #     students << {name: name, cohort: cohort}
# #     puts "Now we have #{students.count} student#{students.count > 1 ? "s" : ""}"
# #     puts "put thename of the student"
# #     name = gets.chomp.to_sym
# #     puts "put the cohort of the student"
# #     cohort = gets.chomp.to_sym
# #   end
# #   students
# # end
#
# # ----------------------- Exercise 10 -----------------------
# # We've been using the chomp() method to get rid of the last return character.
# # RETURN - NOWA LINIA - also a character
# # Find another method among those provided by the String class that could be used
# # for the same purpose (although it will require passing some arguments).
#
# # def input_students_two_values
# #   students = []
# #   puts "To finish hit return two times"
# #   puts "put the name of the student"
# #   name = gets.chomp.to_sym #chomp - removes new lines (without chomp the input will never be empty and we will never end the form)
# #   puts "put the cohort of the student"
# #   cohort = gets.rstrip.to_sym # rstrip - removes whitespaces and empty lines
# #   while !name.empty? || !cohort.empty? do
# #     if name.empty? then
# #       name = "Name not given".to_sym
# #     end
# #     if cohort.empty? then
# #       cohort = "Cohort not given".to_sym
# #     end
# #     students << {name: name, cohort: cohort}
# #     puts "Now we have #{students.count} student#{students.count > 1 ? "s" : ""}"
# #     puts "put thename of the student"
# #     name = gets.chomp.to_sym
# #     puts "put the cohort of the student"
# #     cohort = gets.chomp.to_sym
# #   end
# #   students
# # end
#
# # ----------------------- Exercise 12 -----------------------
# # What happens if the user doesn't enter any students?
# # It will try to print an empty list. How can you use an if statement
# # (Control Flow) to only print the list if there is at least one student in there?
#
# # def input_students_two_values
# #   students = []
# #   puts "To finish hit return two times"
# #   puts "put the name of the student"
# #   name = gets.chomp.to_sym #chomp - removes new lines (without chomp the input will never be empty and we will never end the form)
# #   puts "put the cohort of the student"
# #   cohort = gets.rstrip.to_sym # rstrip - removes whitespaces and empty lines
# #   while !name.empty? || !cohort.empty? do
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
    process(STDIN.gets.chomp)
  end
end

 #  We use gets method to get the input from the keyboard but it actually does something else.
 #  It reads from the list of files supplied as arguments, only defaulting to
 #  the keyboard (or, standard input stream, to be precise) if there are no files.
 # So, our code will now break unless we tell gets() to read specifically from
 # the input stream even if some files have been passed as an argument.

def print_menu
puts
puts "1. Input the students"
puts "2. Show the students"
puts "3. Save the list to students.csv"
puts "4. Load the list from students.csv"
puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students_two_values
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students_two_values
puts "To finish hit return two times"
puts "put the name of the student"
name = STDIN.gets.chomp.to_sym #chomp - removes new lines (without chomp the input will never be empty and we will never end the form)
puts "put the cohort of the student"
cohort = STDIN.gets.rstrip.to_sym # rstrip - removes whitespaces and empty lines
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
    name = STDIN.gets.chomp.to_sym
    puts "put the cohort of the student"
    cohort = STDIN.gets.chomp.to_sym
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

# ----------------------- Saving students to a file -----------------------


def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students have been saved"
end

#If we want to write to a file in Ruby, we need to "open" the file first.
# This is very similar to opening a file in a normal text editor, e.g. Atom.
# When we open a file, the open() method returns us a reference to the file that
# we can save it a variable called "file". Then we iterate over the array of students,
# processing one student at a time.

# On every iteration we create a new array with the student name and the cohort,
# that is, the information we want to save to the file. We do this in order to
# convert it to a comma-separated string on the next line.
# The join() method joins all elements of the array it's called on together,
# using its argument as a separator. Finally, we write the csv line to the file
# using the familiar puts() method, except we call it on a file, so it writes to
# the file and not on the screen.

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  puts "File #{filename} has been loaded"
  file.close
end

# on line 4 above we use parallel assignment.
# we are assigning two variables at the same time.
# In our file every line has one comma, so if split the line at this comma,
# we'll get an array with two values.
# The first one will become the name and the second one will become the cohort.

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# So, now the method accepts the filename as an argument.
# However, if the argument is not supplied, then the value "students.csv" will be used.
# This value is called the default value for an argument.
# Providing it allows us to call the method either without the arguments or with one argument:

#### load_students # will load from students.csv by default
#### load_students(list.txt) # will load from list.txt


try_load_students()
interactive_menu()

# when opening direcroy.rb write ruby directory.rb students.csv - then the files will be loaded
