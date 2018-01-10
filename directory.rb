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




people = input_students()
