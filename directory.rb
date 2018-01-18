
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
puts "2. Show the students"
puts "3. Save the list of students to a file"
puts "4. Load the list of students from a file"
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

def save_students
  puts "type the name of file where you want to save the students"
  name_of_file = STDIN.gets.chomp
  file = File.open("#{name_of_file}", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students have been saved"
end

def what_files
  puts Dir.glob("*.{csv}")
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

try_load_students()
interactive_menu()
