require_relative 'procedures'

def controller
  input = ARGV
  command = input.first
  input.shift

  case command
  when "list"
    display_list
  when "add"
    text = input.join(" ")
    add(text)
    display_list
  when "delete"
    input.each do |n|
      n = n.to_i
      unless (list[n-1].nil?)
        delete(n)
      else
        display_error_no_list(n)
      end
    end
    display_list
  when "edit"
    n = input.first.to_i
    unless (list[n-1].nil?)
      edit(n)
    else
      display_error_no_list
    end
    display_list
  when "toggle"
    n = input.first.to_i
    unless (list[n-1].nil?)
      toggle(n)
    else
      display_error_no_list
    end
    display_list
  else
    display_error_no_command
  end
end