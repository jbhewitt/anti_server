class AddPlayerToLogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :player, :team
    add_reference :players, :team, foriegn_key: true
    add_reference :logs, :player, foriegn_key: true
  end
end
