class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :content
      t.integer :charge
      t.integer :number_of_people
      t.datetime :event_start
      t.datetime :event_end
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
