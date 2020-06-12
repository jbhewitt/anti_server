class AddNameToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :name, :string
    add_column :players, :hash, :string
    remove_column :players, :alias
  end
end
