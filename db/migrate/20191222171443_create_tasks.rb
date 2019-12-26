class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|

      t.string :name
      t.string :description
      t.string :priority
      t.string :deadline
      t.string :status
      t.references :project, index: true, foreign_key: true
      t.timestamps
    end
  end
end
