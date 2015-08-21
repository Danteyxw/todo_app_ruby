require_relative '../config/application'
require_relative 'models/task'

# thoughts
=begin
  Models
    store the methods and attributes
    R/W to the database
  Controller
    parse inputs
  View
    display

  List
    has many todos
  Todo
    belongs to list

  or

  Todo
    id
    done
    text

  Controller
    list
    add
    delete
    toggle
    edit
=end

# Controller
def process_input
  input = ARGV
  command = input.first
  input.shift

  case command
  when "list"
    display_list
  when "add"
    text = input.join(" ")
    add(text)
  when "delete"
    input.each do |n|
      n = n.to_i
      unless (list[n-1].nil?)
        delete(n)
      else
        display_error_no_list(n)
      end
    end
  when "edit"
    n = input.first.to_i
    unless (list[n-1].nil?)
      edit(n)
    else
      display_error_no_list
    end
  when "toggle"
    n = input.first.to_i
    unless (list[n-1].nil?)
      toggle(n)
    else
      display_error_no_list
    end
  else
    display_error_no_command
  end
end

def list
  tasks = Task.all.order(id: :asc)
end

def add(text)
  task = Task.new(done: false, text: text)
  task.save
end

def delete(n)
  task = list[n-1]
  task.delete
end

def toggle(n)
  task = list[n-1]
  task.done = !task.done
  task.save
end

def edit(text)
  task = list[n-1]
  task.text = text
  task.save
end

# View
def display_list
  list.each_with_index do |task, i|
    done = task.done ? "x" : " "
    p "#{i+1}. [#{done}] #{task.text}"
  end
end

def clear_screen!
  print "\e[2J"
end

def move_to_home!
  print "\e[H"
end

def display_error_no_list(n)
  puts "Task #{n} does not exist."
end

def display_error_no_command
  puts "Unknown command."
end

# Main
process_input