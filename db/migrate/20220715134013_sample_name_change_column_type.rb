class SampleNameChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :bio, :text)
    change_column(:comments, :text, :text)
    change_column(:posts, :text, :text)
  end
end
