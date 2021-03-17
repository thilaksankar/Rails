class RemoveTopicRefFromTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :tags, :topic_id, null: false
  end
end
