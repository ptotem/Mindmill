class AddParametersToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :active, :boolean
    add_column :projects, :description, :text
  end
end
