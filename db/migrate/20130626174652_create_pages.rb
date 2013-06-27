class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :wiki_title
      t.text :body
      t.text :body_html
      t.integer :user_id
      t.integer :revision

      t.timestamps
    end
  end
end
