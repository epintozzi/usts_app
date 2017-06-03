module ShoppingCartHelper

  def unpaid_race_reg_count(current_user)
    RaceRegistration.unpaid_race_reg(current_user).count
  end

  def unpaid_usts_reg_count(current_user)
   UstsRegistration.unpaid_usts_reg(current_user).count
  end

  def total_upaid_reg(current_user)
    return unpaid_usts_reg_count(current_user) + unpaid_race_reg_count(current_user)
  end

end
