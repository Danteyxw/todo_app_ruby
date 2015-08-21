def display_list
  clear_screen!
  move_to_home!
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