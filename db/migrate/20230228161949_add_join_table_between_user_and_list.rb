class AddJoinTableBetweenUserAndList < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :lists do |t|
      t.index [:user_id, :list_id], unique: true
      t.index [:list_id, :user_id], unique: true
    end
  end
end
