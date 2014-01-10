class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :url
      t.boolean :status
      t.integer :level

      t.timestamps
    end
  end
end
