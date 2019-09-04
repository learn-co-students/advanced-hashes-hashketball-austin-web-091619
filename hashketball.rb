require "pry"

def game_hash
  game = {:home => {:team_name =>"Brooklyn Nets",
:colors => ["Black", "White"],
  :players => ["Alan Anderson" => {
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

          ]},
:away => {:team_name => "Charlotte Hornets",
:colors => ["Turquoise", "Purple"],
:players => ["Jeff Adrien" => {
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
          }]
  }}
end



def num_points_scored(name_to_find)
  hash = game_hash
  hash.each do |location, data|
    data.each do |k, v|
    if k == :players
    v.each do |player_hash|
      player_hash.each do |name, stats|
        if name == name_to_find
          stats.each do |stat_key, stat_value|
            if stat_key == :points
              return stat_value
            end
          end
        end
      end
    end
  end
end
end
end


def shoe_size(name_to_find)
  hash = game_hash
  hash.each do |location, data|
    data.each do |k, v|
    if k == :players
    v.each do |player_hash|
      player_hash.each do |name, stats|
        if name == name_to_find
          stats.each do |stat_key, stat_value|
            if stat_key == :shoe
              return stat_value
            end
          end
        end
      end
    end
  end
end
end
end


def team_colors(name_to_find)
  hash = game_hash
  hash.each do |location, data|
    data.each do |k, v|
      if k == :team_name && hash[location][:team_name] == name_to_find
        return hash[location][:colors]
      end
    end
  end
end


def team_names
  hash = game_hash
  teamarr = []
  hash.each do |location, data|
    data.each do |k, v|
      if k == :team_name
        teamarr << v
      end
    end
  end
  return teamarr
end


def player_numbers(team_name)
  hash = game_hash
  numbers = []
  place = ""
  hash.each do |location, data|
    data.each do |key, value|
      if key == :team_name && hash[location][:team_name] == team_name
        place = location
      end
      end
    end
    hash[place].each do |a, b|
      if a == :players
        b.each do |player|
          player.each do |name, info|
            info.each do |stat, value|
              if stat == :number
                numbers << value
              end
            end
          end
        end

      end
    end
return numbers
end


def player_stats(name_to_find)
  hash = game_hash
  hash.each do |location, data|
    data.each do |k, v|
    if k == :players
    v.each do |player_hash|
      player_hash.each do |name, stats|
        if name == name_to_find
          return stats
            end
          end
        end
      end
    end
  end
end


def big_shoe_rebounds
  hash = game_hash
  size = 0
  who = ""
  hash.each do |location, data|
    data.each do |k, v|
    if k == :players
    v.each do |player_hash|
      player_hash.each do |name, stats|
        stats.each do |a, b|
          if a == :shoe && size < b
            size = b
            who = name
        end
         end
          end
          #here is where who becomes the person with largest shoe shoe_size
          player_hash.each do |name, stats|
            stats.each do |a, b|
              if name == who && a == :rebounds
                return b
              end
            end
          end
        end
      end
    end
  end
end

#I will be working on the bonus questions and resumbitting this.

def most_points_scored
hash = game_hash
points = 0
who = ""
hash.each do |location, data|
  data.each do |k, v|
  if k == :players
  v.each do |player_hash|
    player_hash.each do |name, stats|
      stats.each do |a, b|
        if a == :points && points < b
          points = b
          who = name
      end
       end
        end
      end
end
end
end
return who
end


def winning_team
hash = game_hash
home = 0
away = 0
hash.each do |location, data|
  data.each do |key, value|
    if key == :players
      value.each do |name_hash|
        name_hash.each do |name, stats|
          stats.each do |info, num|
        if location == :away && info == :points
          away += num
        end
        if location == :home && info == :points
          home += num
        end
      end
    end
  end
end
end
end
if home > away
  return hash[:home][:team_name]
else
  return hash[:away][:team_name]
end
end


def player_with_longest_name
  hash = game_hash
  longest = ""
  hash.each do |location, data|
    data.each do |k, v|
    if k == :players
    v.each do |player_hash|
      player_hash.each do |name, stats|
        if name.length > longest.length
          longest = name

        end
          end
        end
      end
    end
  end
  return longest
end



def long_name_steals_a_ton?
  hash = game_hash
  longest = ""
  most_steals = 0
  most_steal_name = ""
  hash.each do |location, data|
    data.each do |k, v|
    if k == :players
    v.each do |player_hash|
      player_hash.each do |name, stats|
        if name.length > longest.length
          longest = name
          where = location
        end
        stats.each do |key, value|
          if key == :steals && value > most_steals
            most_steals = value
            most_steal_name = name
          end
        end
      end
    end
  end
end
end
if longest == most_steal_name
  return true
else
  return false
end
end
