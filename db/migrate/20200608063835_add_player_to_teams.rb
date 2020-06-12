class AddPlayerToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :player, :team
  end
end
