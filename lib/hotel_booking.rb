require './hotel'

class HotelBooking

  attr_reader :customer, :arrival_date, :departure_date, :hotel

  def initialize(booking_info)

    @customer = booking_info[:name]
    @hotel = Hotel.new(booking_info[:arriving], booking_info[:departing])

  end

end

# p = {name: "Pedro", arriving: "27 7 2016", departing: "29 7 2016"}
# booking = HotelBooking.new(p)
# puts "1"
# puts booking.customer
# puts "2"
# puts booking.hotel.arriving
# puts "3"
# puts booking.hotel.departing
# puts "4"
# puts booking.hotel.name
# puts "5"
# puts booking.hotel.find_room
# puts "6"
# puts booking.hotel.list_hotels
# puts "7"
# new_hotel_value = {name: "Stank Hotel", address: "Vancouver", total_rooms: 13, rooms_taken: 0, cost: 50}
# puts booking.hotel.add_hotel(new_hotel_value)
# puts "8"
# puts booking.hotel.list_hotels
