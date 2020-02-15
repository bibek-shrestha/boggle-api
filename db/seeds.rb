# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# File.open(File.join(Rails.public_path, 'en.txt')) do |file|
#     file.each do |line|
#         word = Word.create({value: line.strip})
#     end
# end
#
connection = ActiveRecord::Base.connection
if Rails.env.development?
  sql = File.read('db/englishdictionary.sql') # Change path and filename as necessary
  statements = sql.split(/;$/)
  statements.pop
end
if Rails.env.test?
  sql = File.read('db/testdictionary.sql') # Change path and filename as necessary
  statements = sql.split(/;$/)
  statements.pop
end
ActiveRecord::Base.transaction do
  statements.each do |statement|
    connection.execute(statement)
  end
end
