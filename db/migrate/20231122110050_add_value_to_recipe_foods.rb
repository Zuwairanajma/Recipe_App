class AddValueToRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :recipe_foods, :value, :decimal
  end
end
