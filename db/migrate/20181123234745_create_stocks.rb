class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.string :last_price
      
      t.date :updated_at
       t.date :created_at
    end
  end
end
