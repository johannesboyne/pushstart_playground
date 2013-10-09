class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.float :funding_goal
      t.float :funded
      t.string :state

      t.timestamps
    end
  end
end