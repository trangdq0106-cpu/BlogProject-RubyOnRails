class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :Name
      t.text :comment
      t.references :blog, index: true, foreign_key: true

      t.timestamps
    end
  end
end
