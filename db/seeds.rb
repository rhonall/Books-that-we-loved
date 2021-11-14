# User.destroy.all
# Author.destroy.all
# Genre.destroy.all
# Book.destroy.all
# OwnedBook.destroy.all

genres = [
  Genre.create!(name: "art"),
  Genre.create!(name: "biography"),
  Genre.create!(name: "business"),
  Genre.create!(name: "children's"),
  Genre.create!(name: "classics"),
  Genre.create!(name: "contemporary"),
  Genre.create!(name: "cookbooks"),
  Genre.create!(name: "crime"),
  Genre.create!(name: "fantasy"),
  Genre.create!(name: "fiction"),
  Genre.create!(name: "history"),
  Genre.create!(name: "horror"),
  Genre.create!(name: "humor"),
  Genre.create!(name: "memoir"),
  Genre.create!(name: "music"),
  Genre.create!(name: "mystery"),
  Genre.create!(name: "non-fiction"),
  Genre.create!(name: "philosophy"),
  Genre.create!(name: "poetry"),
  Genre.create!(name: "psychology"),
  Genre.create!(name: "religion"),
  Genre.create!(name: "romance"),
  Genre.create!(name: "science"),
  Genre.create!(name: "self-help"),
  Genre.create!(name: "suspense"),
  Genre.create!(name: "spirituality"),
  Genre.create!(name: "sports"),
  Genre.create!(name: "thriller"),
  Genre.create!(name: "travel"),
  Genre.create!(name: "young-adult")
]

# user1 = User.create!(email: "foo@a.com", password: "password")

# author1 = Author.create!(name: "Matt Haig")

# book1 = Book.create!(title: "The Comfort Book: The instant No. 1 Sunday Times bestseller", author: author1, description: "*Updated to include a new chapter from the author on finding the light side of the darkest days of the year* THE INSTANT NUMBER ONE SUNDAY TIMES BESTSELLER Reflections on hope, survival and the messy miracle of being alive It is a strange paradox, that many of the clearest, most comforting life lessons are learned while we are at our lowest. But then we never think about food more than when we are hungry and we never think about life rafts more than when we are thrown overboard. The Comfort Book is a collection of consolations learned in hard times and suggestions for making the bad days better. Drawing on maxims, memoir and the inspirational lives of others, these meditations celebrate the ever-changing wonder of living. This is for when we need the wisdom of a friend or a reminder we can always nurture inner strength and hope, even in our busy world. A book of timeless comfort for modern minds.", book_api_id: "HIACEAAAQBAJ", genre_id: ["", "6", "24"], cover: "http://books.google.com/books/content?id=HIACEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api")

# owned_book_1 = user1.owned_books.create!(book_id: book1.id, condition: "like-new", format: "paperback", owner_note: "One of my favourite book, it helped me through some rough times. Hopefully it can help someone else as well!")

# puts "#{Author.count}/1 author was created"
# puts "#{Genres.count}/30 genres were created"
# puts "#{Book.count}/1 book was created"
# puts "#{OwnedBook.count}/1 book was created"




