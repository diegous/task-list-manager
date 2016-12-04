class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :type
      t.belongs_to :list, index: true
      t.belongs_to :state, index: true
      t.belongs_to :priority, index: true

      t.string :description, :null => false

      t.date :start_date
      t.date :end_date

      t.integer :percentage

      t.timestamps
    end
  end
end
