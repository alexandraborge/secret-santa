# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {name: 'Brian Borge', email: 'brianborge@test.com', password: 'foobar', password_confirmation: 'foobar'},
  {name: 'Alaina Ingram', email: 'alaina@test.com', password: 'foobar', password_confirmation: 'foobar'},
  {name: 'Caroline Lazzaruolo', email: 'caroline@test.com', password: 'foobar', password_confirmation: 'foobar'},
  {name: 'Roneiro Lazzaruolo', email: 'roneiro@test.com', password: 'foobar', password_confirmation: 'foobar'},
  {name: 'Alexandra Borge', email: 'alexandra@test.com', password: 'foobar', password_confirmation: 'foobar'}
]

users.each do |user|
  User.create!(user)
end

secret_santa_game = {creator: 1, group_name: 'Borges', game_title: 'Secret Santa', date_of_draw: '2020-01-01', date_of_game: '20202-01-29', budget: 50}
SecretSantaGame.create(secret_santa_game)

User.all.each do |user|
  SecretSantaUser.create(
    user_id: user.id,
    secret_santa_game_id: SecretSantaGame.last.id,
    gift_receiver: nil
  ) 
end
