class AddPhashToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :phash, :string
    remove_column :players, :hash
  end
end
