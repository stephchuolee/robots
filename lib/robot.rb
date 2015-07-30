require_relative 'errors'

class Robot

    MAX_WEIGHT = 250
    MAX_HEALTH = 100

attr_accessor :position, :items, :items_weight, :health, :hitpoints, :equipped_weapon, :capacity

include Errors 

  # l/r is index 0, up down is index 1
  def initialize
    @position = [0,0] 
    @items = []
    @health = 100 
    @hitpoints = 5
    @equipped_weapon
  end 


  #movement methods 

  #rewrite position array item 0  
  #### ASK ABOUT THIS ####
  def move_left
    self.position[0] -= 1
    # @position[0] -= 1
    # position should be an attr_reader
  end 

  #rewrite position array item 1 
  def move_right
    self.position[0] += 1
  end 

  def move_up
    self.position[1] += 1
  end 

  def move_down
    self.position[1] -= 1
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

  # simpler way of items_weight method 
  # def items_weight  
    # items.inject(0) {|sum, item| sum + item.weight}
  # end 

  #health methods 

  def wound(damage)
    if damage > health 
      self.health = 0 
    else 
      self.health -= damage 
    end 


    # self.health -= damage 
    # if health <= 0 
    #   self.health == 0
    # end 

    # SIMPLER METHOD: 

    # @health = health - damage < 0 ? 0 : health - damage

    # OR 

    # @health = health - damage < MAX_HEALTH ? MAX_HEALTH : health - damage 

    #DRY:: 
    # new_health = health - damage  
    # @health = new_health < MAX_HEALTH ? MAX_HEALTH : new_health 

  end 

  def heal(heal)
    self.health += heal
    if health >= 100
      self.health = 100
    end 
  end 


  def heal!
    if health == 0 
      raise RobotAlreadyDeadError, "You can't heal a dead robot"
    else 
      heal
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

    # alternatively
    # equipped_weapon ? equipped_weapon.hit(enemy) : enemy.wound(DEFAULT_ATTACK)

    # if equipped_weapon 
    #   equipped_weapon.hit(enemy)
    # else 
    #  enemy.wound(DEFAULT_ATTACK)
    # end 
  end 

  def enemy_nearby?(enemy)
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










end
