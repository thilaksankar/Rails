class RemovePostRefFromTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :tags, :post_id, null: false
  end
end
