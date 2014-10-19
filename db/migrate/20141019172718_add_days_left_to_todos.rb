class AddDaysLeftToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :days_left, :integer
  end
end
