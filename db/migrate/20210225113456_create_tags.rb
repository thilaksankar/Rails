class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :tag
      t.references :post
      t.references :topic
      t.timestamps
    end
  end
end
