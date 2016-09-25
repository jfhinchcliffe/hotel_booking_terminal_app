require './hotel_booking'
require './hotel'
require 'colorize'


def main_menu
  exit = false

  until exit
    puts "Welcome to HotelBooker".blue
    puts "==" * 12
    puts "1. See all hotels 📔 "
    puts "2. Book Hotel 🛌 "
    puts "3. Add Hotel 🏠 "
    puts "4. Settle Bill 💳 "
    puts "5. Exit the program ❌ "
    puts "==" * 12
    puts "6. About HotelBooker 🤔 "
    print "> "
    selection = $stdin.gets.chomp
    case selection
    when "1"
      show_all_hotels
    when "2"
      book_hotel
    when "3"
      add_hotel
    when "4"
      settle_bill
    when "5"
      puts "👋 👋 👋 👋 👋 Later!👋 👋 👋 👋 👋"
      exit = true
    when "6"
      about
    end

  end

end

def about
  system "clear"
  puts " 🏢 " + "  HotelBooker  🏢 "
  puts "©1986, CompuHyperMegaSoftware.com"
  puts "Press any button to go back to the main menu"
  `say "Hotel Booker. The future of hotel management software is now!" -r 250 -v Zarvox`
  gets
  system "clear"
end

def show_all_hotels
  Hotel.list_hotels
end

def book_hotel
  Hotel.book_hotel
end

def add_hotel
  Hotel.add_hotel
end

def settle_bill
  Hotel.settle_bill
end
#system "clear"
system "clear"
main_menu
#Hotel.list_hotels
