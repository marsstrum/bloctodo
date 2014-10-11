class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :item
      t.boolean :completed
      t.references :user, index: true

      t.timestamps
    end
  end
end
