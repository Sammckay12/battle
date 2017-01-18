class Health

  attr_reader :health, :attack

  def initialize(health)
    @health = 100
  end

  def attack
    @health -= 10
  end

end
