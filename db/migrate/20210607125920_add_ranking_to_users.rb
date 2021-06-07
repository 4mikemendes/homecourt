class AddRankingToUsers < ActiveRecord::Migration[6.0]
  def change
        add_column :users, :ranking, :string
  end
end
