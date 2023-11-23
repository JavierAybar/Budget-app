class CreateGroupsOperationsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :groups, :operations
  end
end
