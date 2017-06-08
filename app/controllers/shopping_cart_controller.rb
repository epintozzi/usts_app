class ShoppingCartController < ApplicationController

  def show
    @unpaid_race_registrations = RaceRegistration.unpaid_race_reg(current_user)
    @unpaid_usts_registrations = UstsRegistration.unpaid_usts_reg(current_user)
  end

  def create
    pay_for = cart_params
    # fix this to pull real IDs
    item_list = find_usts_registration(pay_for) + find_race_registration(pay_for)

    # put anything that gets redirected into a "pending" state

    values = {
        business: "merchant@gotealeaf.com",
        cmd: "_cart",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}/cart",
        invoice: 2,
    }
    i = 1
    item_list.each do |object|
      values.merge!({"amount_#{i}".to_sym => object[0], "item_name_#{i}".to_sym => object[1]})
      i += 1
    end

    redirect_to "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  private

  def find_usts_registration(pay_for_array)
    usts_items_and_prices = []
    pay_for_array[:usts_reg].each do |id|
      usts_reg = UstsRegistration.find(id)
      price = usts_reg.membership_prices[usts_reg.membership_type.to_sym]
      item_name = "#{usts_reg.race_year} USTS Membership for: #{usts_reg.first_name} #{usts_reg.last_name}"
      usts_items_and_prices << [price, item_name]
    end
    return usts_items_and_prices
  end

  def find_race_registration(pay_for_array)
    race_items_and_prices = []
    pay_for_array[:race_reg].each do |id|
      race_reg = RaceRegistration.find(id)
      price = race_reg.boat_class.registration_fee
      item_name = "Race Registration for: #{race_reg.usts_registration.first_name} #{race_reg.usts_registration.last_name} at #{race_reg.race.city} | #{race_reg.boat_class.class_name}"
      race_items_and_prices << [price, item_name]
    end
    return race_items_and_prices
  end


  # returned value will look like:
  # { usts_reg: [1,2], race_reg: [2,3] }
  def cart_params
    unpaid_race_registrations = RaceRegistration.unpaid_race_reg(current_user).pluck(:id)
    unpaid_usts_registrations = UstsRegistration.unpaid_usts_reg(current_user).pluck(:id)
    return {usts_reg: unpaid_usts_registrations[0..1], race_reg: unpaid_race_registrations[0..1] }
  end

end
