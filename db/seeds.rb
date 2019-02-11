require 'faker' # on inclus la gem faker qui avs nous permettre de generer des donnees
@no_rep=0
20.times do
  @no_rep+=1
  conversation = Conversation.create!(role: "Role A", replique: "replique du premier personnage", user_id:1 , name: "Alice")
  @no_rep+=1
  conversation = Conversation.create!(role: "Role B", replique: "replique du second personnage", user_id: 2, name: "Bob")
end
4.times do
  @no_rep+=1
  mp = Conversation.create!(role: "Role A", replique: "replique du premier personnage", user_id: 1, name: "Alice", pm: "Ceci est un message prive. Salut Bob. La cle secrete est rhyg6543ijhu7687hyhyhyhy")
  @no_rep +=1
  mp = Conversation.create!(role: "Role B", replique: "replique du second personnage", user_id: 2, name: "Bob", pm: "Salut Alice. la cle secrete est oeem9487mjfl0989jjfmmfjf") 
# on vide toutes les tables
end
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table City avec des donnee cree par faker
  ville = City.create!(name: Faker::Address.city,zip_code: Faker::Address.zip_code)
end

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table User avec des donnee cree par faker
  utilisateur = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph,email: Faker::Internet.email, age: rand(18..75),city_id: rand((City.first.id)..(City.last.id)))
end

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table Gossip avec des donnee cree par faker
 tweety = Gossip.create!(title: Faker::Book.title,content: Faker::Lorem.sentence,user_id: rand((User.first.id)..(User.last.id)))
end

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table Tag avec des donnee cree par faker
  style = Tag.create!(title: Faker::Lorem.words(8),gossip_id: rand((Gossip.first.id)..(Gossip.last.id)))
end

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table PrivateMessage avec des donnee cree par faker
  pm = PrivateMessage.create!(content: Faker::Lorem.sentence,sender_id: rand((User.first.id)..(User.last.id)),recipient_id: rand((User.first.id)..(User.last.id)))
end
