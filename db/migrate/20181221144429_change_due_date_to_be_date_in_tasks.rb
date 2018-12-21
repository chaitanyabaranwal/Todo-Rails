class ChangeDueDateToBeDateInTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :due_date, :date
  end

  def down
    change_column :tasks, :due_date, :datetime
  end
end
