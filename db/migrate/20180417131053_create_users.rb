class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :förnamn
      t.string :efternamn
      t.string :mail
      t.string :password

      t.timestamps
    end
  end
end
