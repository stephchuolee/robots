require_relative 'errors'

class Robot

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
  def move_left
    self.position[0] -= 1
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
      
    if item.is_a? Weapon 
      self.equipped_weapon = item
    elsif items_weight < 250 && item.weight <= 250
      self.items << item 
    else 
      false
    end 

  end 

  #returns total weight of items 
  def items_weight
    @items_weight = 0
    items.each { |item| @items_weight += item.weight }
    @items_weight 
  end 


  #health methods 
  ### THE HEALTH MAX/MINS FAIL 3 failures now

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
    if equipped_weapon == nil 
      enemy.wound(hitpoints)
    else 
      equipped_weapon.hit(enemy)
    end 

  end 

  def attack!(enemy)
    if enemy.is_a? Robot 
      attack(enemy)
    else 
      raise UnattackableEnemy, "You can't attack non-robots!"
    end 

  end 










end
