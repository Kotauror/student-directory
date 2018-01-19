require'csv'
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
puts
puts "1. Input the students"
puts "2. Load the list of students from a file"
puts "3. Show the students"
puts "4. Print students from a particular cohort"
puts "5. Print students whose name starts with a particular letter"
puts "6. Save the list of students to a file"
puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students_two_values
    when "2"
      load_students
    when "3"
      show_students
    when "4"
      print_from_cohort
    when "5"
      print_students_name_letter
    when "6"
      save_students
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

def save_students
  puts "type the name of file where you want to save the students"
  puts "you can make a new file or use an existing one"
  puts "existing files are:"
  puts what_files()
  name_of_file = STDIN.gets.chomp
  name_of_file = name_of_file + ".csv" if name_of_file[-4..-1] != ".csv"
  CSV.open(name_of_file, "w") do |file|
      @students.each do |student|
        file << [student[:name], student[:cohort]]
      end
    end
  puts "#{@students.count} students have been saved to #{name_of_file}"
end

# def save_students
#   puts "type the name of file where you want to save the students"
#   puts "you can make a new file or use an existing one"
#   puts "existing files are:"
#   puts what_files()
#   name_of_file = STDIN.gets.chomp
#   name_of_file = name_of_file + ".csv" if name_of_file[-4..-1] != ".csv"
#   file = File.open("#{name_of_file}", "w")
#   # iterate over the array of students
#   @students.each do |student|
#     student_data = [student[:name], student[:cohort]]
#     csv_line = student_data.join(",")
#     file.puts csv_line
#   end
#   file.close
#   puts "Students have been saved"
# end

def what_files
  puts ">> #{Dir.glob("*.{csv}")}"
end

def load_students
  while true do
    puts "Type a name of file, from which you want to load students"
    puts "You can load students from the following files:"
    puts " #{what_files()}"
    filename = STDIN.gets.chomp
    if File.exists?(filename)
      file = File.open(filename, "r")
      file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
        @students << {name: name, cohort: cohort.to_sym}
        puts "File #{filename} has been loaded"
      end
      break
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
    end
  end
  file.close
end

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

def print_students_name_letter
  puts "Please type the first letter of student's name"
  letter = STDIN.gets.chomp
  puts "Students whose names start with #{letter}:"
  @students.each { |student|
    if student[:name][0] == letter then
      puts student[:name]
    end
  }
end

def print_from_cohort
  puts "from which cohort would you like to print students?"
  choice = STDIN.gets.chomp
  counter = 0
  puts "Students from #{choice} cohort: "
  @students.each { |hash|
    if hash[:cohort] == choice.to_sym then
      puts hash[:name]
      counter += 1
    end
  }
  if counter == 0 then
    puts "There are no students in #{choice} cohort"
  end
end

try_load_students()
interactive_menu()
