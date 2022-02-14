class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :age
      t.date :joining_date
      t.string :contact_number
      t.string :email

      t.timestamps
    end
  end
end
