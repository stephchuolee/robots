require_relative 'errors'
require 'pry'

class Robot

    MAX_WEIGHT = 250
    MAX_HEALTH = 100

  attr_reader :position, :items, :items_weight, :health, :hitpoints


  attr_accessor :equipped_weapon, :shield_points

  include Errors 

  # l/r is index 0, up down is index 1

  @@robot_array = [] 

  def initialize
    @position = [0,0] 
    @items = []
    @health = 100 
    @hitpoints = 5
    @equipped_weapon
    @shield_points = 50
    @@robot_array << self 
  end

  #movement methods 

  #rewrite position array item 0  
  #### ASK ABOUT THIS ####
  def move_left
    @position[0] -= 1
    # @position[0] -= 1
    # position should be an attr_reader
  end 

  #rewrite position array item 1 
  def move_right
    @position[0] += 1
  end 

  def move_up
    @position[1] += 1
  end 

  def move_down
    @position[1] -= 1
  end 


  #items interaction methods

  def pick_up(item)
      
    if item.is_a?(Weapon)
      self.equipped_weapon = item
      #why return true here? 
      true 
    elsif item.is_a?(BoxOfBolts) && health <= 80
      item.feed(self)
    elsif items_weight < 250 && item.weight <= 250
      self.items << item 
    else 
      false
    end 

  end 

  def items_weight
    @items_weight = 0
    items.each { |item| @items_weight += item.weight }
    @items_weight 
  end 


  #health methods 

  def wound(damage)
    # binding.pry
    residual_damage = damage - shield_points
    new_health = @health
    if residual_damage > 0 
      @shield_points = 0
      new_health = @health - residual_damage  
    else 
      @shield_points -= damage 
    end 

    if new_health < 0 
      @health = 0 
    else 
      @health = new_health 
    end 

  end
   

  def heal(heal)
    @health += heal
    if health >= 100
      @health = 100
    end 
  end 


  def heal!(hp) 
    if health == 0 
      raise RobotAlreadyDeadError, "You can't heal a dead robot" 
    else  
      heal(hp)
      # raise RobotAlreadyDeadError, "You can't heal a dead robot" if dead 
      # else normal heal(amount of healing) 
    end 
  end 




  #attack methods


  def attack(enemy)

    if enemy_nearby?(enemy) 
      if equipped_weapon == nil 
        enemy.wound(hitpoints)
      else 
        equipped_weapon.hit(enemy)
      end 
    elsif enemy_grenadeable?(enemy) && equipped_weapon.is_a?(Grenade)
        enemy.wound(hitpoints) 
      self.equipped_weapon = nil
    end 


  end 

  def enemy_nearby?(enemy) #(enemy, range) <= range
    ((enemy.position[0] - position[0]).abs <= 1 && (enemy.position[1] == position[1])) || 
    ((enemy.position[1] - position[1]).abs <= 1 && (enemy.position[0] == position[0]))
  end 

  def enemy_grenadeable?(enemy)
    ((enemy.position[0] - position[0]).abs <= 2 && (enemy.position[1] == position[1])) || 
    ((enemy.position[1] - position[1]).abs <= 2 && (enemy.position[0] == position[0]))
  end 

  def attack!(enemy)
    if enemy.is_a? Robot 
      attack(enemy)
    else 
      raise UnattackableEnemy, "You can't attack non-robots!"
    end 
  end 

  def x
    @position[0]
  end

  def y
    @position[1]
  end

  def scan()
    # Robot.in_position(x, y) +
    Robot.in_position(x - 1, y) + 
    Robot.in_position(x + 1, y) +
    Robot.in_position(x, y - 1) + 
    Robot.in_position(x, y + 1)
  end

  ## Class Methods 

  # @@robot_counter = 0 

  def self.in_position(x, y)

    @@robot_array.select do |robot| 
      robot.position == [x,y]
    end 
    #returns an array of all robots in position [x,y]
  end

  def self.robot_array
    @@robot_array
  end
end
