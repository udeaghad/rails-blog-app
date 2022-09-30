grace = User.create(name: "Grace", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit...")
john = User.create(name: "John", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...")
mark = User.create(name: "Mark", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...")

grace_post_1 = Post.create(user: grace, title: "Letter Writing", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
john_post_1 = Post.create(user: john, title: "Creating Blog", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
grace_post_2 = Post.create(user: grace, title: "Cooking tips", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
john_post_2 = Post.create(user: john, title: "Create an account", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
  

grace_post_3 = Post.create(user: grace, title: "Exercising", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
mark_post_1 = Post.create(user: mark, title: "Choosing color", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
grace_post_4 = Post.create(user: grace, title: "Health tips", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
john_post_4 = Post.create(user: john, title: "Hashes", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
grace_post_5 = Post.create(user: grace, title: "Buying cars", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")


mark_post_2 = Post.create(user: mark, title: "Flying", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua") 
john_post_3 = Post.create(user: john, title: "Creating Blog", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")



Comment.create( post: john_post_1, user: grace,text: "cool")
Comment.create( post: mark_post_2, user: john, text: "cool")



Comment.create( post: grace_post_3, user: mark, text: "lovely")
Comment.create( post: john_post_2, user: grace, text: "I like your post")
Comment.create( post: grace_post_3, user: john, text: "I disagree with your post")
Comment.create( post: john_post_2, user: mark,text: "thank you")


Comment.create( post: mark_post_1, user: john, text: "great")
Comment.create( post: john_post_3, user: grace, text: "nice")

Comment.create( post: grace_post_1, user: john, text: "cool")
Comment.create( post: grace_post_2, user: john, text: "lovely")

Comment.create( post: grace_post_5, user: john,text: "i like")
Comment.create( post: john_post_1, user: mark, text: "gratias")
Comment.create( post: grace_post_1, user: mark, text: "cool")
Comment.create( post: mark_post_2, user: grace, text: "really cool")
Comment.create(post: grace_post_2, user: mark,  text: "great")

Comment.create(post: grace_post_4, user: mark,  text: "nice post")
Comment.create(post: john_post_4, user: grace,  text: "beautiful")
Comment.create( post: grace_post_5, user: mark, text: "really nice")
Comment.create(post: grace_post_4, user: john,  text: "I agree")


Comment.create( post: john_post_3, user: mark, text: "nice write up")
Comment.create( post: mark_post_1, user: grace, text: "I learned a lot")
Comment.create( post: john_post_4, user: mark, text: "I agree")

Like.create(user:mark, post:grace_post_1)
Like.create(user:mark, post:grace_post_3)
Like.create(user:mark, post:grace_post_5)
Like.create(user:mark, post:john_post_1)
Like.create(user:mark, post:john_post_2)
Like.create(user:mark, post:john_post_4)
Like.create(user:grace, post:john_post_1)
Like.create(user:grace, post:john_post_2)
Like.create(user:grace, post:john_post_3)
Like.create(user:john, post:grace_post_1)
Like.create(user:john, post:grace_post_2)
Like.create(user:john, post:grace_post_3)
Like.create(user:john, post:grace_post_5)

puts "database updated"





  