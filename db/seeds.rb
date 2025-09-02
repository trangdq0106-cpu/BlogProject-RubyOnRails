# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cat = Comment.create(comment: 'Bai viet hay qua, hay qua, hay qua')

(13..100).each do |i|
    Blog.create!(title: 'might give you more control', shortdescription: ' and modularity to your seeds. It inserts rake tasks and you can also define dependencies between your seeds. Your rake task list will have these', description: 'actory_bot sounds like it will do what you are trying to achieve. You can define all the common attributes in the default definition and then override them at creation time. You can also pass an id to the factory:', published: true, comment_id: cat.id)
end

