class AddRateToRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :rate, :string
  end
end
