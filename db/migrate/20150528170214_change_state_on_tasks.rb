class ChangeStateOnTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.change  :state, :string, default: 'Por fazer'
    end
  end
end
