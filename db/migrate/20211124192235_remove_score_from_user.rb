class RemoveScoreFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :score, :string
  end
end
