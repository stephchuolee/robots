

class Item
  #should just be attr_reader
  attr_accessor :name, :weight

  def initialize(name, weight)
    @name = name 
    @weight = weight 
  end 


end 
