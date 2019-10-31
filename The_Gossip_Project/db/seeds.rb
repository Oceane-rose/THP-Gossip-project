
require 'faker'



City.destroy_all
User.destroy_all
Gossip.destroy_all

# reset autoincrement for tables to start by id=1

City.connection.execute('ALTER SEQUENCE cities_id_seq RESTART WITH 1')
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
Gossip.connection.execute('ALTER SEQUENCE gossips_id_seq RESTART WITH 1')


number = 0 # create 25 fake cities 
loop do 
    number = number + 1
    sleep(0.1)
    City.create(name:Faker::Address.city)
    puts "city has been seeded #{number} times"
    break if number == 25
end

User.create(first_name:"Antoine", last_name:"leguillou", description:"Blablablabla", email:"antoine@sfr.fr", age:25, city:City.first, password:"foobar")


number =0 #create 100 fake Gossips 
loop do
    number = number + 1
    sleep(0.1)
    Gossip.create(title:Faker::Book.title, content:Faker::Quote.famous_last_words, user:User.first )
    puts "#{number} Gossip(s) has been added to the database"
    break if number == 100
end





