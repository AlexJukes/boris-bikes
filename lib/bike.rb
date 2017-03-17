class Bike
 # Currently redundant code 
  def working?
    true
  end

  def report_broken
    @broken = true
  end
  attr_reader :broken
end
