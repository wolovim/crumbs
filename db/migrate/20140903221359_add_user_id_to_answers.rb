class AddUserIdToAnswers < ActiveRecord::Migration
  def up
  	add_column :answers, :user_id, :integer
  end

  def down
  	remove_column :answers, :user_id, :integer
  end
end
