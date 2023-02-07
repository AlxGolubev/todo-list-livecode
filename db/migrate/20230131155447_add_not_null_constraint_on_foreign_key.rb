class AddNotNullConstraintOnForeignKey < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :list_id, false
  end
end
