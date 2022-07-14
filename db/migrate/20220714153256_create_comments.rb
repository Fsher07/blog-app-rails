class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :author, index:true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
