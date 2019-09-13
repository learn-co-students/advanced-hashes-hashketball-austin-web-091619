require "pry"
def game_hash
return hash = {
  :home => {
    :team_name => 'Brooklyn Nets ',
    :colors => [Black, White],
    :players => ['Alan Anderson' => 
      {:number => '',
      :shoe => '',
      :points => '',
      :rebounds => '',
      :assists => '',
      :steal => '',
      :blocks => '',
      :slam_dunks => ''}
    ]
  } , 
  :away => {
    :team_name => ' ',
    :colors => [],
    :players => [
      {:number => '',
      :shoe => '',
      :points => '',
      :rebounds => '',
      :assists => '',
      :steal => '',
      :blocks => '',
      :slam_dunks => ''}
    ]
  }
}
end
 def good_practices
   game_hash.each do |location, team_data|
     binding.pry
     team_data.each do |attribute, data|
       binding.pry
       data.each do |data_item|
         binding.pry
       end
    end
  end
end
good_practices
    
     

 










