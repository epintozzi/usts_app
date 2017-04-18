# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

boat_classes = BoatClass.create!(
  [ {class_name: 'KPro', registration_fee: 15},
    {class_name: '125cc Hydro', registration_fee: 50},
    {class_name: '125cc Runabout', registration_fee: 50},
    {class_name: '175cc Hydro', registration_fee: 50},
    {class_name: '250cc Hydro', registration_fee: 50},
    {class_name: '250cc Runabout', registration_fee: 50},
    {class_name: '350cc Hydro', registration_fee: 50},
    {class_name: '350cc Runabout', registration_fee: 50},
    {class_name: '500cc Hydro', registration_fee: 50},
    {class_name: '500cc Runabout', registration_fee: 50},
    {class_name: '700cc Hydro', registration_fee: 50},
    {class_name: '700cc Runabout', registration_fee: 50},
    {class_name: '1100cc Hydro', registration_fee: 50},
    {class_name: '1100cc Runabout', registration_fee: 50},
    {class_name: 'C-Racing Hydro', registration_fee: 50},
    {class_name: 'C-Racing Runabout', registration_fee: 50},
    {class_name: 'C-Service Hydro', registration_fee: 50},
    {class_name: 'C-Service Runabout', registration_fee: 50},
    {class_name: 'OSY', registration_fee: 50}
  ])

Race.create!(
  [
    { street_address: "175 N. Nekoma Ave",
      city: "Lake Alfred",
      state: "FL",
      start_date: "2017-04-21 07:00:00",
      end_date: "2017-04-23 07:00:00",
      sanction: "sanction.pdf",
      details: "For those attending the Lake Alfred, FL race: All teams will be required to have a tarp underneath the engines of all of their boats at all times when in the pit area and working on the engine with any fluids, beginning when you arrive to when you leave. In addition, cans with gas and methanol are not be next to any generators. This is being monitored by the City of Lake Alfred and they have advised us that they will not tolerate any exceptions. The first time it is a warning and the second time you will be disqualified for the day. There will be a barrel available to dump your oils into.",
      latitude: 28.0928333,
      longitude: 	-81.7340688,
      hotel_information: "Florida HomeStay Inn 33224 Hwy 27 South Haines City, FL 33844 Room Rates are set at $69.00 plus tax Date range that rooms shall be ready for occupancy is 4/19 thru 4/23 We will offer an early check-in for your group starting at 2pm Please have all of your group members/participants calling in to make reservation, use the following code to help us identify who they are: ORANGE17 Florida HomeStay Inn 33224 Hwy 27 South Haines City, FL 33844 (863) 422 8621 (Front Desk) (863) 422 8622 Due call us with all of your questions and travel coordination arrangements, so that we can better assist you prior to your arrival. Feel free to contact me directly or Gina (Guest Relations Manager) at the hotel. Juan Exposito (561) 281 3365 Mobile"
    },
    { street_address: "Park Dr",
      city: "Pleasant Prairie",
      state: "WI",
      start_date: "2017-05-26 07:00:00",
      end_date: "2017-05-28 07:00:00",
      sanction: "sanction.pdf",
      details: "More details coming soon.",
      latitude: 42.530116,
      longitude: 	-87.926402,
      hotel_information: "LA Quinta Inn	262-857-7911, Best Western Executive 262-857-7699, Comfort Suites 262-857-3450, Value	Inn	262-857-2622"
    },
    { street_address: "149 N. Lakewood Dr",
      city: "Springfield",
      state: "IL",
      start_date: "2017-06-30 07:00:00",
      end_date: "2017-07-02 07:00:00",
      sanction: "sanction.pdf",
      details: "More details coming soon.",
      latitude: 39.6845682,
      longitude: 	-89.6508451,
      hotel_information: "Baymont Inn and Suites, Springfield IL 5871 S. 6th St. Frontage RD east Springfield, IL 62703 Phone (217) 529-6655. Block date: June 29 through July 1 Thursday-Saturday night. Block rate: Doubles @ $95.00 + Tax, Kings @ $85.00 + Tax. Please call (217) 529-6655 and ask them to reserve a room out of : USTS boat race. Mihir Tals Manger Baymont Inn & Suites, Springfield IL 5871 South 6th St Rd frontage rd e Springfield IL 62703 Phone: (217) 529-6655 Ext. 676 Fax: (217) 529-6510 e-fax: (888) 340-3033 email: baymontsp@aol.com"
    },
    { street_address: "65079 US 131-N",
      city: "Constantine",
      state: "MI",
      start_date: "2017-07-21 07:00:00",
      end_date: "2017-07-23 07:00:00",
      sanction: "sanction.pdf",
      details: "More details coming soon.",
      latitude: 41.8526111,
      longitude: 	-85.668731,
      hotel_information: "Hotel Information Coming Soon"
    },
    { street_address: "Lake DePue",
      city: "DePue",
      state: "IL",
      start_date: "2017-07-26 07:00:00",
      end_date: "2017-07-30 07:00:00",
      sanction: "sanction.pdf",
      details: "More details coming soon.",
      latitude: 41.3230718,
      longitude: 	-89.3114441,
      hotel_information: "Hotel Information Coming Soon"
    },

  ]
)
