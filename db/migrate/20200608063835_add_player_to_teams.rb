class AddPlayerToTeams < ActiveRecord::Migration[6.0]
  def change
	  add_colmun :logs, :client_version, :string
	  add_column :players, :phash, :string
  end
end
