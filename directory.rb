# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]
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

def print_students(students)
  students.each { |student|
    puts "#{student[:name]} #{student[:cohort]} cohort"
  }
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

# the output of input_students method (it returns students) is assigned to a
# new variable that we will use in the functions below 
people = input_students()
print_header
print_students(people)
print_footer(people)
