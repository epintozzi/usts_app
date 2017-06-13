class ShoppingCartController < ApplicationController
  protect_from_forgery except: [:hook]

  def show
    @unpaid_race_registrations = RaceRegistration.unpaid_race_reg(current_user)
    @unpaid_usts_registrations = UstsRegistration.unpaid_usts_reg(current_user)
  end

  def create
    pay_for = cart_params
    item_list = find_usts_registration(pay_for) + find_race_registration(pay_for)

    # put anything that gets redirected into a "pending" state
    values = {
        business: Rails.application.secrets.paypal_merchant,
        cmd: "_cart",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}/cart",
        notify_url: "#{Rails.application.secrets.app_host}/hook",
        no_shipping: 1,
        no_note: 1,
        custom: pay_for.to_json
    }
    i = 1
    item_list.each do |object|
      values.merge!({"amount_#{i}".to_sym => object[0], "item_name_#{i}".to_sym => object[1]})
      i += 1
    end
    # TODO: update payment status to pending here
    
    redirect_to "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  def hook
    params.permit!
    puts params.to_json
    # sample response:
    # {"mc_gross":"90.00","protection_eligibility":"Eligible","item_number1":"","item_number2":"","payer_id":"GSFH5HM3LK7H4","item_number3":"","payment_date":"17:57:25 Jun 12, 2017 PDT","payment_status":"Completed","charset":"windows-1252","first_name":"Joseph","mc_fee":"2.91","notify_version":"3.8","custom":"{\"usts_reg\":[\"2\"],\"race_reg\":[\"18\",\"20\"]}","payer_status":"verified","business":"merchant@gotealeaf.com","num_cart_items":"3","verify_sign":"A2YnYs6LuOd-R8BHIdbWTA6xHgalA7mjQ2Y-MLYHXCPsr4L-PB5kTsTs","payer_email":"coconuts20x6@gmail.com","txn_id":"3A768868P2623945S","payment_type":"instant","last_name":"Pintozzi","item_name1":"2017 USTS Membership for: Brad Barth","receiver_email":"merchant@gotealeaf.com","item_name2":"Race Registration for: Erin Pintozzi at Springfield | KPro","payment_fee":"2.91","item_name3":"Race Registration for: Erin Pintozzi at DePue | 125cc Hydro","quantity1":"1","quantity2":"1","receiver_id":"SJU9C73A5B5FL","quantity3":"1","txn_type":"cart","mc_gross_1":"25.00","mc_currency":"USD","mc_gross_2":"15.00","mc_gross_3":"50.00","residence_country":"US","test_ipn":"1","transaction_subject":"","payment_gross":"90.00","ipn_track_id":"23060ab8af52f","controller":"shopping_cart","action":"hook"}
    status = params[:payment_status] # Pending/Completed
    txn_id = params[:txn_id]
    payment_date = params[:payment_date]
    payer_email = params[:payer_email]
    payer_id = params[:payer_id]

    if status == "Completed"
      # store our transaction ID here
      # and mark stuff as paid
      ids = JSON.parse(params[:custom])
      usts_reg_ids = ids["usts_reg"]
      UstsRegistration.where(id: usts_reg_ids).update_all(paid: UstsRegistration.paids[:paid], transaction_number: txn_id, payment_date: payment_date, payer_email: payer_email, payer_id: payer_id)
      race_reg_ids = ids["race_reg"]
      RaceRegistration.where(id: race_reg_ids).update_all(paid: RaceRegistration.paids[:paid], transaction_number: txn_id, payment_date: payment_date, payer_email: payer_email, payer_id: payer_id)
    end
    head :ok
  end

  private

  def find_usts_registration(pay_for_array)
    usts_items_and_prices = []
    pay_for_array["usts_reg"].each do |id|
      usts_reg = UstsRegistration.find(id)
      price = usts_reg.membership_prices[usts_reg.membership_type.to_sym]
      item_name = "#{usts_reg.race_year} USTS Membership for: #{usts_reg.first_name} #{usts_reg.last_name}"
      usts_items_and_prices << [price, item_name]
    end
    return usts_items_and_prices
  end

  def find_race_registration(pay_for_array)
    race_items_and_prices = []
    pay_for_array["race_reg"].each do |id|
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
    { "usts_reg" => [], "race_reg" => []}.merge(params.permit(usts_reg: [], race_reg: []))
  end

end
