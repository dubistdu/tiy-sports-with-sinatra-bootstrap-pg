require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?

get '/' do
  database = PG.connect(dbname: "tiy-sports")
  @rows = database.exec("select count(players.id) as player_count, teams.name, teams.description, teams.image_url from teams, memberships, players where teams.id = memberships.team_id and players.id = memberships.player_id group by teams.name, teams.description, teams.image_url")
#  @game_row = database.exec("select id, team_id, away, score, name from games, teams where games.team_id = teams.name")
  erb :home
end


# teams.name, teams.description, teams.image_url is teams. optional? but better to have there to be more specific?

            # <tr class='success'>
            #   <% @games.each do |game| %>
            #   <th scope='row'><%= @games.count %></th>
            #   <td><%= game["name"] %></td>
            #   <td><%= game["away"] %></td>
            #   <td><%= game["score"] %></td>
            #   <% end %>
            # </tr>
