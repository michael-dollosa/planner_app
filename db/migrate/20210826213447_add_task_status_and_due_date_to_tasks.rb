class AddTaskStatusAndDueDateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :status, :string
    add_column :tasks, :due_date, :datetime
  end
end
