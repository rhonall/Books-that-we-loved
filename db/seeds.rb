FavGenre.destroy_all
Genre.destroy_all
User.destroy_all
Author.destroy_all
Book.destroy_all
OwnedBook.destroy_all
Request.destroy_all


# Genres
Genre.create!(name: "art")
Genre.create!(name: "biography")
Genre.create!(name: "business")
Genre.create!(name: "children's")
Genre.create!(name: "classics")
Genre.create!(name: "contemporary")
Genre.create!(name: "cookbooks")
Genre.create!(name: "crime")
Genre.create!(name: "fantasy")
Genre.create!(name: "fiction")
Genre.create!(name: "history")
Genre.create!(name: "horror")
Genre.create!(name: "humor")
Genre.create!(name: "memoir")
Genre.create!(name: "music")
Genre.create!(name: "mystery")
Genre.create!(name: "non-fiction")
Genre.create!(name: "philosophy")
Genre.create!(name: "poetry")
Genre.create!(name: "psychology")
Genre.create!(name: "religion")
Genre.create!(name: "romance")
Genre.create!(name: "science")
Genre.create!(name: "self-help")
Genre.create!(name: "suspense")
Genre.create!(name: "spirituality")
Genre.create!(name: "sports")
Genre.create!(name: "thriller")
Genre.create!(name: "travel")
Genre.create!(name: "young-adult")

# Users
user1 = User.new(username: "admin", email: "admin@foo.com", password: "password")
user1.fav_genres.new(genre: Genre.find(5))
user1.save
user1.add_role :admin
user2 = User.new(username: "user2", email: "user2@foo.com", password: "password")
user2.fav_genres.new(genre: Genre.find(10))
user2.save
user3 = User.new(username: "user3", email: "user3@foo.com", password: "password")
user3.fav_genres.new(genre: Genre.find(11))
user3.save
user4 = User.new(username: "user4", email: "user4@foo.com", password: "password")
user4.fav_genres.new(genre: Genre.find(13))
user4.save

# Books

data1 = GoogleBooks.search('Normal People').first
book1 = Book.new(title: data1.title, description: data1.description, book_api_id: data1.id, cover: data1.image_link)
data1.authors_array.each do |author|
  Author.create!(name: author)
  book1.authors << Author.find_by(name: author)
end
book1.genres << Genre.where(name: 'contemporary')
book1.genres << Genre.where(name: 'fiction')
book1.save

data2 = GoogleBooks.search('the magpie society: one for sorrow').first
book2 = Book.new(title: data2.title, description: data2.description, book_api_id: data2.id, cover: data2.image_link)
data2.authors_array.each do |author|
  Author.create!(name: author)
  book2.authors << Author.find_by(name: author)
end
book2.genres << Genre.where(name: 'fiction')
book2.genres << Genre.where(name: 'young-adult')
book2.save

data3 = GoogleBooks.search('the comfort book').first
book3 = Book.new(title: data3.title, description: data3.description, book_api_id: data3.id, cover: data3.image_link)
data3.authors_array.each do |author|
  Author.create!(name: author)
  book3.authors << Author.find_by(name: author)
end
book3.genres << Genre.where(name: 'self-help')
book3.save

data4 = GoogleBooks.search('the alchemist').first
book4 = Book.new(title: data4.title, description: data4.description, book_api_id: data4.id, cover: data4.image_link)
data4.authors_array.each do |author|
  Author.create!(name: author)
  book4.authors << Author.find_by(name: author)
end
book4.genres << Genre.where(name: 'fantasy')
book4.genres << Genre.where(name: 'fiction')
book4.save

data5 = GoogleBooks.search('Sapiens').first
book5 = Book.new(title: data5.title, description: data5.description, book_api_id: data5.id, cover: data5.image_link)
data5.authors_array.each do |author|
  Author.create!(name: author)
  book5.authors << Author.find_by(name: author)
end
book5.genres << Genre.where(name: 'non-fiction')
book5.save

# Owned Book
user1.owned_books.create!(book: book1, condition: 2, format: 0, owner_note: "Lovely book, love reading it so much!", image: {io: File.open(File.join(Rails.root, "/db/images/normal-people.jpg")), filename: "normal_people_image" })
user2.owned_books.create!(book: book2, condition: 3, format: 0, owner_note: "Interesting story, can't put it down!", image: {io: File.open(File.join(Rails.root, "/db/images/magpie-society.jpg")), filename: "magpie_society_image" })
user1.owned_books.create!(book: book3, condition: 0, format: 1, owner_note: "One of my fav, can't put it down!", image: {io: File.open(File.join(Rails.root, "/db/images/comfort-book.jpg")), filename: "comfort_book_image" })
user3.owned_books.create!(book: book4, condition: 1, format: 0, owner_note: "Great fantasy fiction!", image: {io: File.open(File.join(Rails.root, "/db/images/the-alchemist.jpg")), filename: "the_alchemist_image" })
user3.owned_books.create!(book: book5, condition: 3, format: 0, owner_note: "Fascinating! Must read!", image: {io: File.open(File.join(Rails.root, "/db/images/sapiens.jpg")), filename: "sapiens_image" })
user2.owned_books.create!(book: book3, condition: 2, format: 0, owner_note: "Strongly Recommended!", image: {io: File.open(File.join(Rails.root, "/db/images/comfort-book2.jpg")), filename: "comfort_book2_image" })


puts "#{User.count}/4 users were created"
puts "#{Book.count}/5 books were created"
puts "#{Author.count}/6 authors were created"
puts "#{Genre.count}/30 genres were created"
puts "#{OwnedBook.count}/6 owned books were created"








