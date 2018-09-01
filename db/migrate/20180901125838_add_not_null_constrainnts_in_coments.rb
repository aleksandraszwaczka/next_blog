class AddNotNullConstrainntsInComents < ActiveRecord::Migration[5.2]
  def up
    change_column_null :comments, :commenter, false
    change_column_null :comments, :body, false
  end

  def down
    change_column_null :comments, :commenter, true
    change_column_null :comments, :body, true
  end
end
