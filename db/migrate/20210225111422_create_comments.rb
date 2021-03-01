class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :post
      t.references :topic
      t.timestamps
    end
  end
end
