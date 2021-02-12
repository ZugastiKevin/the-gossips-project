class AddAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :text
  end
end
