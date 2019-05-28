class UserScore < ApplicationRecord
  belongs_to :user



  def algorithm

    # puts self.user.age

    score = (1 - 0.9660**(w_score - 6.57301)) * 100

    self.health_score = score

    puts 'score added!'
  end

  private

  def w_score
    0.10820 * self.user.age + smoker + 0.04676 * self.bmi - 0.01923 * self.alcohol
    + 0.0004 * self.alcohol**2 - 0.029251 * self.physical_activity * 7 - 0.05113 * diet_score
  end

  def smoker
    if self.user.smoker == 'past'
      0.15285
    elsif self.user.smoker == 'current'
      0.90139
    else
      0
  end

  def diet_score
    (0.03626 * self.whole_grains + fruits_vegetables + fats
      - 0.14631 * self.soda - 0.15624 * (self.red_meat + self.processed_meat)) * 10
  end

  def fruits_vegetables
    if self.fruits_vegetables >= 3
      0.18283
    else
      0
  end

  def fats
    if self.fats > 1
      0.2444
    elsif self.fats >= 0.1
      0.14522
    else
      0
    end
  end

end
