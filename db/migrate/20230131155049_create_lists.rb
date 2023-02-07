class CreateLists < ActiveRecord::Migration[6.1]
  def up
    create_table :lists do |t|
      t.string :title

      t.timestamps
    end

    add_reference :tasks, :list, foreign_key: true
  end

  def down
    drop_table :lists
    remove_reference :tasks, :list
  end
end
