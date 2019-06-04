class UserScore < ApplicationRecord
  belongs_to :user
  after_create :algorithm

  # def algorithm
  #   p risk_score = (1 - 0.9660**(Math::E**(w_score - 6.57301))) * 1000

  #   self.health_score = p 100 - risk_score

  #   self.save

  #   puts 'score added!'
  # end

  def algorithm_v2
    stress_const = 4
    exercise_const = 7
    diet_const = 10
    sleep_const = 5

    p self.health_score = age_clasifier(self.age) + smoker_clasifier(self.user.smoker) + bmi_clasifier(self.bmi) + (stress_calculator(self.heart_rate) * stress_const) + (exercise_calculator * exercise_const) + (sleep_calculator * sleep_const) + (diet_calculator * diet_const)

    self.save!
    puts 'score added!'
  end

  private

  def age_clasifier(age)
    if age <= 34
      age * 0.6032
    elsif age.between?(35, 44)
      age * 0.4082
    elsif age.between?(45, 54)
      age * 0.1082
    elsif age.between?(55, 64)
      age * 0.05082
    elsif age >= 65
      age * 0.03082
    end
  end

  def smoker_clasifier(message)
    if message == 'past'
      -0.15285
    elsif message == 'current'
      -0.90138
    else
      1
    end
  end

  def bmi_clasifier(bmi)
    if bmi.exists?
      if bmi >= 35
        bmi * -1.04676
      elsif bmi.between?(25.1, 30)
        bmi * -0.52338
      else
        bmi * 1.04676
      end
    else
      bmi_clasifier(bmi_calculator)
    end
  end

  def bmi_calculator
    self.bmi = self.weight / (self.height * self.height)
    return self.bmi
  end

  def stress_calculator(heart_rate)
    optimal = 80
    if heart_rate >= 100
      heart_rate / optimal * 1
    elsif heart_rate <= 70
      heart_rate / optimal * 3
    else
      heart_rate / optimal * 4
    end
  end

  def sleep_calculator

  end

  def exercise_calculator

  end

  def diet_calculator

  end
  # def w_score
  #   (0.10820 * self.user.age) + smokermethod + (0.04676 * self.bmi) - (0.01923 * self.alcohol) + (0.0004 * self.alcohol**2) - (0.029251 * self.physical_activity * 7) - (0.05113 * diet_score)
  # end

  # def smokermethod
  #   if self.user.smoker == 'past'
  #     0.15285
  #   elsif self.user.smoker == 'current'
  #     0.90139
  #   else
  #     0
  #   end
  # end

  # def diet_score
  #   (0.03626 * self.whole_grains + fruitsVegetables + fatsmethod - 0.14631 * self.soda - 0.15624 * (self.red_meat + self.processed_meat)) * 10
  # end

  # def fruitsVegetables
  #   if self.fruits_vegetables >= 3
  #     0.18283
  #   else
  #     0
  #   end
  # end

  # def fatsmethod
  #   if self.fats > 1
  #     0.2444
  #   elsif self.fats >= 0.1
  #     0.14522
  #   else
  #     0
  #   end
  # end

end
