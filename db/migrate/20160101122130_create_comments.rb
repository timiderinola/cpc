class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :email
      t.text :content
      t.references :message, index: true

      t.timestamps
    end
  end
end
