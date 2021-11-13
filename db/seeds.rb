Book.destroy.all
Author.destroy.all
Genre.destroy.all
BookGenre.destroy.all
AuthorBook.destroy.all
User.destroy.all
OwnedBook.destroy.all

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

