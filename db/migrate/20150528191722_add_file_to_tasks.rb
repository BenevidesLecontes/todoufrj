class AddFileToTasks < ActiveRecord::Migration
  def up
    add_attachment :tasks, :file
  end

  def down
    remove_attachment :tasks, :file
  end
end
