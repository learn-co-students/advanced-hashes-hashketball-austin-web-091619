require "pry"

def game_hash
  hashketball = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)

  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
      
      if value2.include?(player)
        return game_hash[key1][key2][player][:points]
      end

    end
  end
end

def shoe_size(player)

  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
      
      if value2.include?(player)
        return game_hash[key1][key2][player][:shoe]
      end

    end
  end
end


def team_colors(team)
  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
    
      if value2.include?(team)
        return game_hash[key1][:colors]
      end

    end
  end
end

def team_names()
teams = []
  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
      
      if value2 == game_hash[key1][:team_name]
        teams << value2
      end
    end
  end
    return teams
end

def player_numbers(team_name)
player_numbers = []

  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
    
        if value2 == team_name
          game_hash[key1][:players].each do |player_name, data|
              player_numbers << data[:number]
          end
      end
    end
  end
    return player_numbers
end

def player_stats(player_name)

  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
    
       if value2.include?(player_name) 
       return game_hash[key1][key2][player_name]

      end
    end
  end
end

def big_shoe_rebounds()

player_shoe_size = 0
player_rebound = 0

  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
 
      game_hash[key1][:players].each do |player_name, data|
        if data[:shoe] > player_shoe_size 
          player_shoe_size = data[:shoe]
          player_rebound = data[:rebounds]

        end
      end
    end
  end
return player_rebound
end


def most_points_scored()

most_points = 0
player = nil

  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
 
      game_hash[key1][:players].each do |player_name, data|
        if data[:points] > most_points
          most_points = data[:points]
          player = player_name

        end
      end
    end
  end
return player
end

def winning_team()

team_home = 0
team_away = 0
winning_team = nil

  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
 
      if value2 == "Brooklyn Nets"
        game_hash[key1][:players].each do |player_name, data|
        team_home += data[:points]
          end
        end
        
      if value2 == "Charlotte Hornets"
        game_hash[key1][:players].each do |player_name, data|
        team_away += data[:points]
        
        if team_home > team_away
          winning_team = "Brooklyn Nets"
        else
          winning_team = "Charlotte Hornets"
          end
        end
      end
    end
  end
return winning_team
end


def player_with_longest_name()

char_count = 0
player = nil
  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
 
      game_hash[key1][:players].each do |player_name, data|
        if player_name.length > char_count
          char_count = player_name.length
          player = player_name

        end
      end
    end
  end
return player
end


def long_name_steals_a_ton?()

most_steals = 0
player = nil
  game_hash.each do |key1, value1| 
    value1.each do |key2, value2| 
 
      game_hash[key1][:players].each do |player_name, data|
        if data[:steals] > most_steals
          most_steals = data[:steals]
          player = player_name
        end
      end
    end
  end
return player == player_with_longest_name()
end





