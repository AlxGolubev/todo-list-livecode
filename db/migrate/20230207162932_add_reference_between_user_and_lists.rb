class AddReferenceBetweenUserAndLists < ActiveRecord::Migration[6.1]
  def change
    add_reference :lists, :user, foreign_key: true
  end
end
