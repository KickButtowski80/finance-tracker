class RemoveDefaultDatesFromNote < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:user_stocks, :created_at, nil)
  end
end
