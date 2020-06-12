class AddFilesToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :files, :string
  end
end
