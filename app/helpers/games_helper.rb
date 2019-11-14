module GamesHelper
  def game_types
    ['Secret Santa', 'Greedy Grab Bag']
  end

  def secret_santa?
    @game.game_title == 'Secret Santa'
  end

  def drawing_date
    @game.date_of_draw
  end

  def countdown_to_draw
    (drawing_date.to_date - DateTime.now.to_date).to_i
  end

  def instructions
    {
      'Secret Santa': "When the game creator starts the drawing, everyone will recieve an email that will 
      contain the name of the player in this group that you are getting a gift for. 
      You can also check your profile to find this information. Once you know who you are getting
      a gift for you can check out their profile to see their wish list! You may buy a gift for this person within the budget set.
      On game day all players will take turns giving their gifts to eachother.",

      'Greedy Grab Bag': "You must buy a gift that everyone would like.
      At game time, the game creator will start the game from their device and everyone 
      will recieve a text message wiith their number. The number will determine
      whose turn it is. On your turn you will choose to open a gift or steal a gift from another player. 
      Remember, whoever goes first also goes last! Have fun!"
    }[@game.game_title.to_sym]
  end
end
