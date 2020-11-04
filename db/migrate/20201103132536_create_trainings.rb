class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.text :goal,         null: false
      t.string :reward,     null: false
      t.date :date_start,   null: false
      t.references :user,               foreign_key: true 

      t.timestamps
    end
  end
end
