module SecretSantaGamesHelper
  def game_types
    ['Secret Santa', 'Greedy Grab Bag']
  end

  def drawing_date
    @secret_santa.date_of_draw
  end

  def countdown_to_draw
    (drawing_date.to_date - DateTime.now.to_date).to_i
  end

  def instructions
    "When the game creator starts the drawing, everyone will recieve an email that will 
    contain the name of the player in this group that you are getting a gift for. 
    You can also check your profile to find this information. Once you know who you are getting
    a gift for you can check out their profile to see their wish list! You may buy a gift for this person within the budget set.
    On game day all players will take turns giving their gifts to eachother."
  end
end
