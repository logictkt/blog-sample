class RemoveBody < ActiveRecord::Migration[6.1]
  def up
    remove_column :notes, :body
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
