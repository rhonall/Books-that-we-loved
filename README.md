# Books that we loved

Books that we loved is a platform that user can swap their books with others without any cost. Quite often after we finish a book, we might not want or be able to keep the book, such as moving, not having enough space, or simply do not want to keep it. In that case, instead, we send them to a landfill, would it be nice we can use that book to swap with something we want to read?

Books that we loved targets anyone who loves books!!! Especially those who want to swap their books with some new books to read.

![Deployed website through heroku](https://books-that-we-loved.herokuapp.com/)

## Main Features

- User can post their books up for swapping
- User can edit or delete their owned books
- User can select their favorite genres when they first sign in and this information will display on the request form to help the requester to choose which book to offer
- Users can request to swap one of their books with a book that they wish to read
- User can edit or delete requests they made
- User can accept or decline any requests they receive
- User can find books by authors and genres options in the top bar, or use the search bar

## Tech stack

- Ruby: Version 3.0.2
- Ruby on Rails: Version 6.1.4.1
- HTML5
- CSS
- PostgreSQL
- heroku

I am using heroku for deploying and Cloudinary for hosting uploaded images. 

## Installation

** This game is developed in Ruby and requires Ruby installed to run. Please check out ![here](https://www.ruby-lang.org/en/downloads/) to find instructions to download and install Ruby for your operating system.

1. Please ensure Ruby is installed or is using the correct version (Ruby 3.0.2).

1. Please ensure Bundler is installed or is using the correct version (Bundler 2.2.28.).

1. Please ensure Postgres is installed or is using the correct version (postgres 14.0).

1. Download the file `Books-that-we-loved-main.zip 'and unzip.

1. Use command line to change directory into that unzip folder:
```
cd (path to src folder)
Example: 
cd Downloads/Books-that-we-loved-main
```

1. Once you are in the folder, use command line to install required gems:
```
bundle install
```

1. Then use command line to create the database and seed the data:
```
rails db:setup
```

1. Finally you can run the rails server with `rails s`, then you should be able to visit the website by access http://localhost:3000 



