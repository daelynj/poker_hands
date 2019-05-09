class Value
  def royal_flush?(hand)
    10
  end

  def straight_flush?(hand)
    9
  end

  def four_of_a_kind?(hand)
    8
  end

  def full_house?(hand)
    7
  end

  def flush?(hand)
    6
  end

  def straight?(hand)
    5
  end

  def three_of_a_kind?(hand)
    4
  end

  def two_pair?(hand)
    3
  end

  def pair?(hand)
    2
  end

  def high_card?(hand)
    1
  end
end
