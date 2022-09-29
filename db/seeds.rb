grace = User.create(name: "Grace", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit...")
john = User.create(name: "John", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...")
mark = User.create(name: "Mark", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...")

grace_post_1 = Post.create(users: grace, title: "Letter Writing", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
john_post_1 = Post.create(users: john, title: "Creating Blog", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
grace_post_2 = Post.create(users: grace, title: "Cooking tips", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
john_post_2 = Post.create(users: john, title: "Create an account", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
  

grace_post_3 = Post.create(users: grace, title: "Exercising", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
mark_post_1 = Post.create(users: mark, title: "Choosing color", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
grace_post_4 = Post.create(users: grace, title: "Health tips", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
john_post_4 = Post.create(users: john, title: "Hashes", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
grace_post_5 = Post.create(users: grace, title: "Buying cars", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")


mark_post_2 = Post.create(users: mark, title: "Flying", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua") 
john_post_3 = Post.create(users: john, title: "Creating Blog", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")



Comment.create( posts: john_post_1, users: grace,text: "cool")
Comment.create( posts: mark_post_2, users: john, text: "cool")



Comment.create( posts: grace_post_3, users: mark, text: "lovely")
Comment.create( posts: john_post_2, users: grace, text: "I like your post")
Comment.create( posts: grace_post_3, users: john, text: "I disagree with your post")
Comment.create( posts: john_post_2, users: mark,text: "thank you")


Comment.create( posts: mark_post_1, users: john, text: "great")
Comment.create( posts: john_post_3, users: grace, text: "nice")

Comment.create( posts: grace_post_1, users: john, text: "cool")
Comment.create( posts: grace_post_2, users: john, text: "lovely")

Comment.create( posts: grace_post_5, users: john,text: "i like")
Comment.create( posts: john_post_1, users: mark, text: "gratias")
Comment.create( posts: grace_post_1, users: mark, text: "cool")
Comment.create( posts: mark_post_2, users: grace, text: "really cool")
Comment.create(posts: grace_post_2, users: mark,  text: "great")

Comment.create(posts: grace_post_4, users: mark,  text: "nice post")
Comment.create(posts: john_post_4, users: grace,  text: "beautiful")
Comment.create( posts: grace_post_5, users: mark, text: "really nice")
Comment.create(posts: grace_post_4, users: john,  text: "I agree")


Comment.create( posts: john_post_3, users: mark, text: "nice write up")
Comment.create( posts: mark_post_1, users: grace, text: "I learned a lot")
Comment.create( posts: john_post_4, users: mark, text: "I agree")

Like.create(users:mark, posts:grace_post_1)
Like.create(users:mark, posts:grace_post_3)
Like.create(users:mark, posts:grace_post_5)
Like.create(users:mark, posts:john_post_1)
Like.create(users:mark, posts:john_post_2)
Like.create(users:mark, posts:john_post_4)
Like.create(users:grace, posts:john_post_1)
Like.create(users:grace, posts:john_post_2)
Like.create(users:grace, posts:john_post_3)
Like.create(users:john, posts:grace_post_1)
Like.create(users:john, posts:grace_post_2)
Like.create(users:john, posts:grace_post_3)
Like.create(users:john, posts:grace_post_5)

puts "database updated"





  