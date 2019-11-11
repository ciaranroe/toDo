class AddCompletedToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :Completed, :boolean, default:false
  end
end
