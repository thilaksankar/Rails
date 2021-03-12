class RemoveTopicIdFromTaggings < ActiveRecord::Migration[6.1]
  def change
    remove_column :taggings, :topic_id, null: false
  end
end
