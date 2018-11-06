class CreateUserStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stocks do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :stock_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
