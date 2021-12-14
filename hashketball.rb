# Write your code below game_hash
require 'pry'

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
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
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
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


def num_points_scored(player)
  filtered_player = []
  game_hash.each do |team, data|
    data.each do |attribute, value|
      if attribute == :players
        add_player = value.find do |name| 
          name[:player_name] == player
        end
        add_player ? filtered_player << add_player : nil
      end
    end
  end
  filtered_player[0][:points]
end


def shoe_size(player)
  found_player = []
  game_hash.each do |team, data|
    data.each do |attribute, value|
      if attribute == :players
        pro = value.find do |name| 
          name[:player_name] == player
        end
        pro ? found_player << pro : nil
      end
    end
  end
  found_player[0][:shoe]
end


def team_colors(team)
  filtered_team = []
  game_hash.each do |homeaway, data|
    if data[:team_name] == team
      filtered_team << data[:colors]
    end
  end
  filtered_team[0]
end


def team_names
  game_hash.values.map {|v| v[:team_name]}
end


def player_numbers(name_of_team)
  game_hash.each do |team, data|
    if data[:team_name] == name_of_team
      return data[:players].map {|p| p[:number]}
    end
  end
end

def player_stats(player)
  found_player = []
  game_hash.each do |team, data|
    data.each do |attribute, value|
      if attribute == :players
        pro = value.find do |name| 
          name[:player_name] == player
        end
        pro ? found_player << pro : nil
      end
    end
  end
  found_player[0]
end


def big_shoe_rebounds
  player = []
  game_hash.each do |team, data|
    binding.pry
    player << data[:players].sort do |player1, player2|
      player2[:shoe] <=> player1[:shoe]
    end
  end
  player[0][0][:rebounds]
end

