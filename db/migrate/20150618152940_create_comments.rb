class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to    :post
      t.belongs_to    :user
      t.string        :body, null: false
      t.timestamps    null: false
    end
  end
end
