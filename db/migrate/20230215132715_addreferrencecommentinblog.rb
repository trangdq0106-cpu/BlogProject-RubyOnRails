class Addreferrencecommentinblog < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :shortdescription
      t.text :description
      t.boolean :published
      t.string :image
      t.timestamps
    end

    add_reference :blogs, :comment, index: true
  end
end
