require_relative '../config/application'
require_relative 'models/task'
require_relative 'view/view.rb'
require_relative 'controllers/controller.rb'

=begin
  Keywords:
  list: list all your tasks
  add: add a task
  delete: delete a task
  edit: edit the text content of a task
  toggle: toggle the completeness of a task
=end

# Main
controller