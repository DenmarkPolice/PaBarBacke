class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.string :id_token
      t.string :mail
      t.string :address
      t.float :zip
      t.string :city

      t.timestamps
    end
  end
end
