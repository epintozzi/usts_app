module ShoppingCartHelper

  def unpaid_race_reg(current_user)
    RaceRegistration.where(creator_id: current_user.id, paid: false)
  end

  def unpaid_race_reg_count(current_user)
    race_reg_all = unpaid_race_reg(current_user)
    count = 0
    race_reg_all.each do |reg|
      if reg.race.future?
        count +=1
      end
    end
    return count
  end

  def unpaid_usts_reg(current_user)
   UstsRegistration.usts_registrations_this_year.where(creator_id: current_user.id, paid: false)
  end

  def unpaid_usts_reg_count(current_user)
   unpaid_usts_reg(current_user).count
  end

  def total_upaid_reg(current_user)
    return unpaid_usts_reg_count(current_user) + unpaid_race_reg_count(current_user)
  end

end
