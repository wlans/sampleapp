class RemoveColumnFromTable < ActiveRecord::Migration
  def donw
    remove_column :users, :reset_digest
    remove_column :users, :reset_sent_at
  end
end
