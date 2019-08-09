# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(username: "Noah")

b1 = Blog.create(title: "blog one", description: "This is the first blog what do you expect", user: u1)
b2 = Blog.create(title: "blog two", description: "two", user: u1)

l1 = Location.create(name: "Seattle")

p1 = Post.create(title: "post one", preview: "preview post one", content: "yeet brother", blog: b1, location: l1)
p2 = Post.create(title: "post two", preview: "preview post two", content: "yaga", blog: b1, location: l1)

c1 = Collection.create(post: p1)
c2 = Collection.create(post: p2)

im1 = Image.create(collection: c1, url: "www.thisisapicture.com", alt: "")
im2 = Image.create(collection: c2, url: "www.thisisstillapicture.com", alt: "")

pin1 = Pin.create(user: u1, post: p1)
pin2 = Pin.create(user: u1, post: p2)