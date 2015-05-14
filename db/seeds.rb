# Deleting all records from database
puts "Deleting all records from the database."
Message.delete_all
Reply.delete_all
Room.delete_all
User.delete_all

# Create the Users
puts "Creating users"
bob = User.create(name: "Bob Smith", email: "bsmith2016@kellogg.northwestern.edu", password: "qwerty")
mary = User.create(name: "Mary Hunt", email: "mhunt2016@kellogg.northwestern.edu", password: "12345")
tiff = User.create(name: "Tiff Yang", email: "tyang2016@kellogg.northwestern.edu", password: "asdfg")
gordon = User.create(name: "Gordon Shu", email: "gshu2016@kellogg.northwestern.edu", password: "zxcvb")
ray = User.create(name: "Ray Su", email: "rsu2016@kellogg.northwestern.edu", password: "54321")

# Create the Rooms
puts "Creating rooms"
kiei_925 = Room.create(title: "KIEI-925", user_id: bob.id)
at_work = Room.create(title: "At Work", user_id: mary.id)
fin_430 = Room.create(title: "FIN_430", user_id: tiff.id)
spac = Room.create(title: "SPAC", user_id: ray.id)
atrium = Room.create(title: "Atrium", user_id: gordon.id)

# Create the Messages
puts "Creating Messages."
message1 = Message.create(user_id: bob.id, title: "Bored", body: "I can't stop falling asleep", vote: 43, room_id: kiei_925.id)
message2 = Message.create(user_id: mary.id, title: "At Work", body: "I've been browsing ESPN for the last 5 hours", vote: 99, room_id: at_work.id)
message3 = Message.create(user_id: tiff.id, title: "Doing HW", body: "I can't stop modeling financials", vote: 20, room_id: fin_430.id)
message4 = Message.create(user_id: ray.id, title: "GTL", body: "Gym Tan Laundry is all I do at Kellogg", vote: 201, room_id: spac.id)
message5 = Message.create(user_id: gordon.id, title: "MyKellogg", body: "The atrium is where dreams go to die", vote: 4, room_id: atrium.id)

# Create the replies
puts "Creating replies"
message1reply1 = Reply.create(user_id: mary.id, body: "slap yourself to stay awake" , vote: "7", message_id: message1.id)
message1reply2 = Reply.create(user_id: tiff.id, body: "drink water. it helps" , vote: "8", message_id: message5.id)
message2reply1 = Reply.create(user_id: ray.id, body: "My boss hasn't even been in the office for 6 months" , vote: "1", message_id: message2.id)
message3reply1 = Reply.create(user_id: gordon.id, body: "We don't do finance at Kellogg", vote: "2", message_id: message3.id)
message4reply1 = Reply.create(user_id: bob.id, body: "I just do laundry", vote: "3", message_id: message4.id)

# Create the affiliations
puts "Creating affiliations"
Affiliation.create(user_id: bob.id, room_id: kiei_925.id)
Affiliation.create(user_id: mary.id, room_id: at_work.id)
Affiliation.create(user_id: tiff.id, room_id: fin_430.id)
Affiliation.create(user_id: ray.id, room_id: spac.id)
Affiliation.create(user_id: gordon.id, room_id: atrium.id)

puts "There are now #{Message.count} messages, #{User.count} users, #{Room.count} rooms, #{Affiliation.count} affiliations, and #{Reply.count} replies in the database."

