class AddSexToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :sex, :text
  end
end
