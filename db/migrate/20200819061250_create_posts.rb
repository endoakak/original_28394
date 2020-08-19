class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :title,       null: false
      t.text       :content,     null: false
      t.boolean    :spoiler,     null: false, default: true
      t.integer    :category_id, null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
