
require "pry"
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def get_players
  players_array= []
  game_hash.each do |location, team_data|
  team_data[:players].each do |players_stat|
   players_array << players_stat
  end
end
players_array
end

def num_points_scored(name)
  points = 0
   get_players.each do |players_info|
     if name == players_info[:player_name]
     points = players_info[:points]
  end
end
points
end

def shoe_size(name)
  shoes= 0
  get_players.each do |players_info|
    if name == players_info[:player_name]
      shoes = players_info[:shoe]
    end
  end
  shoes
end

def team_colors(team)
  colors=[]
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      colors = team_data[:colors]
   end
 end
colors
end

def team_names
  teams= []
 game_hash.each do |location, team_data|
   teams << team_data[:team_name]
 end
 teams
end

def player_numbers(team)
  jersey= []
  game_hash.each do |location, team_data|
    if  team == team_data[:team_name]
      team_data[:players].each do |players_info|
        jersey << players_info[:number]
      end
    end
  end
  jersey
end

def player_stats(name)
  stats = []
  get_players.each do |players_info|
      if name == players_info[:player_name]
         stats = players_info
     end
  end
  stats.shift
  stats
end

def find_biggest_shoe
  all_shoes= []
  get_players.each do |players_info|
      all_shoes << players_info[:shoe]
  end
  biggest_shoe = all_shoes.max
end

def big_shoe_rebounds
  rebounds = 0
  get_players.each do |players_info|
    if find_biggest_shoe == players_info[:shoe]
      rebounds= players_info[:rebounds]
    end
  end
  rebounds
end

def max_points
  all_points= []
  get_players.each do |players_info|
    all_points << players_info[:points]
  end
  most_points= all_points.max
end

def most_points_scored
  highest_player= " "
  get_players.each do|players_info|
    if max_points == players_info[:points]
       highest_player = players_info[:player_name]
     end
   end
   highest_player
 end


def home_score
  total_points = []
  game_hash[:home][:players].each do |sum|
    total_points << sum[:points]
   end
  total_points.reduce(:+)
end

def away_score
  total_points = []
  game_hash[:away][:players].each do |sum|
    total_points << sum[:points]
   end
  total_points.reduce(:+)
end

def winning_team
  if away_score < home_score
    game_hash[:home][:team_name]
  else
      game_hash[:away][:team_name]
   end
end

def player_with_longest_name
  all_names = []
  get_players.each do |players_info, info|
    all_names << players_info[:player_name]
  end
  longest_name= all_names.max_by(&:length)
  longest_name
end

def highest_steals
  highest_steals = []
  get_players.each do |players_info|
    highest_steals << players_info[:steals]
    end
  theif= highest_steals.max
  name = " "
    get_players.each do |players_info|
    if theif == players_info[:steals]
     name = players_info[:player_name]
      end
    end
    name
end


def long_name_steals_a_ton?
  if highest_steals == player_with_longest_name
    true
  else
    false
  end
end

def add_points
  points = []
  get_players.each do |players_info|
    points << players_info[:slam_dunks] += 1
    binding.pry
  end
end
