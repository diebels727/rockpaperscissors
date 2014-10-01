class Sign
  attr_reader :id

  def initialize(id=nil)
    @id = id.to_sym
  end

  def ties?(sign)
    self.id == sign.id
  end

  def beats?(sign)
    case self.id
    when :rock
      sign.id == :scissors
    when :scissors
      sign.id == :paper
    when :paper
      sign.id == :rock
    else
      false
    end
  end

  def name
    name = self.id.to_s
    name.capitalize
  end

  def self.all
    @all ||= [:rock,:paper,:scissors].map {|s| new s }
  end

  def self.random
    all.sample
  end
end