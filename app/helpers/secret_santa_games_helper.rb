module SecretSantaGamesHelper
  def drawing_date
    @secret_santa.date_of_draw
  end

  def countdown_to_draw
    (drawing_date.to_date - DateTime.now.to_date).to_i
  end

  def creator_of_game
    creator_user_id = @secret_santa.creator
    User.find(creator_user_id)[:name]
  end

  def is_creator_of_game?
    current_user[:id] == @secret_santa.creator
  end

  def instructions
    "When #{creator_of_game} starts the drawing, each person may check the games card on their profile page.
    It will be updated with the name of the person they are getting a gift for. But don't worry, no one else will be able to see this.
    Once you know who you are getting a gift for you can check out their profile to see their wish list!
    Check the budget to see how much to spend on a gift for this person.
    On game day all players will take turns giving their gifts to eachother."
  end

  def current_user_is_player?
    SecretSantaUser.find(current_user[:id]).present? && @secret_santa_user.id.present?
  end

  def game_info_table
    data = [
      {label: 'Group Name', value: @secret_santa.group_name},
      {label: 'Group Creator', value: creator_of_game},
      {label: 'Budget', value: "$#{@secret_santa.budget.to_i}"},
      {label: 'Game Date', value: @secret_santa.date_of_game.strftime('%B %d, %Y')}
    ]

    DataTable.render(data) do |t|
      t.column(:label)
      t.column(:value)
    end.html_safe
  end

  def draw_happened?
    SecretSantaUser.find { |user| user.secret_santa_game_id == @secret_santa.id }[:gift_receiver].present?
  end

  def link_path
    request_parts = {
      host: request.host,
      path: signup_path,
      query: {
        token: @secret_santa.token
      }.to_query
    }

    if %w[development test].include? Rails.env
      request_parts.merge!(port: request.port)
    end

    URI::HTTPS.build(request_parts)
  end
end
