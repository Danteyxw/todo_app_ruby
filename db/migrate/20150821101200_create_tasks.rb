require_relative "../../config/application"

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :done
      t.string :text
    end
  end
end