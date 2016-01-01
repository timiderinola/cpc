class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.string :bible_passage
      t.string :preacher
      t.references :user, index: true

      t.timestamps
    end
  end
end
