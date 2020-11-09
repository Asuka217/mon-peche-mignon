class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.date :date_end,       null: false
      t.references :training, foreign_key: true
      t.references :user,     foreign_key: true
      t.text :report
      t.timestamps
    end
  end
end
