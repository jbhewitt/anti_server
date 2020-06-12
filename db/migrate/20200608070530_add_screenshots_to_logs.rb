class AddScreenshotsToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :screenshots, :string
  end
end
