require 'csv'
module Hotel

  @cost = 0

  def find_room
    "In the find room method"
  end

  def Hotel.list_hotels
    system "clear"
    list_of_hotels = Hotel.get_current_hotels

    list_of_hotels.each do |hotel|
      print "\nName:".blue + " #{hotel[:name]} "
      print "Address:".blue + " #{hotel[:address]} \n"
      print "Total Rooms:".light_magenta + " #{hotel[:total_rooms].to_i} "
      print "Rooms Taken:".light_magenta + " #{hotel[:rooms_taken].to_i} "
      #Method changes text colour depending on the amount of rooms left.
      Hotel.rooms_remaining(hotel[:total_rooms].to_i, hotel[:rooms_taken].to_i)
      print "Cost:".yellow + " $#{hotel[:cost].to_i} per night\n"
    end

    puts "Press any key to return to the menu"
    gets
    system "clear"

  end

  def Hotel.add_hotel(hotel_info = "not_given")
    system "clear"
    added_by_system = false
    hotel_info == "not_given" ? added_by_system = false : added_by_system = true
    if hotel_info == "not_given"
      puts "Please enter the name of the new hotel:"
      print "> "
      name = $stdin.gets.chomp
      puts "Please address of the new hotel:"
      print "> "
      address = $stdin.gets.chomp
      puts "Please enter the total rooms in the new hotel:"
      print "> "
      total_rooms = $stdin.gets.chomp
      puts "Please enter the amount of rooms currently occupied:"
      print "> "
      rooms_taken = $stdin.gets.chomp
      puts "Please enter cost per room, per night:"
      print "> "
      cost = $stdin.gets.chomp
      new_hotel_info = {}
      new_hotel_info[:name] = name
      new_hotel_info[:address] = address
      new_hotel_info[:total_rooms] = total_rooms
      new_hotel_info[:rooms_taken] = rooms_taken
      new_hotel_info[:cost] = cost
      hotel_info = new_hotel_info
    end
    CSV.open("hotels.csv", "a+") do |file|
      file << [hotel_info[:name],hotel_info[:address],hotel_info[:total_rooms],hotel_info[:rooms_taken],hotel_info[:cost]]
    end
    system "clear"
    puts "#{hotel_info[:name]} added to the system!" if added_by_system == false
  end

  def Hotel.rooms_remaining(total_rooms, rooms_remaining)
    percentage_remaining = (100 / total_rooms) * rooms_remaining
    if percentage_remaining > 75
      print "Rooms Remaining:".red + " #{rooms_remaining} (#{percentage_remaining}% taken) \n"
    else
      print "Rooms Remaining:".green + " #{rooms_remaining} (#{percentage_remaining}% taken) \n"
    end
  end

  def Hotel.book_hotel
    system "clear"
    #Diaply the number and name of all hotels
    puts "Hotels:"
    all_hotels = Hotel.get_current_hotels
    all_hotels.each do |hotel|
      puts "#{hotel[:name]}"
    end
    puts "Please enter the name of the hotel you'd like to book"
    print "> "
    selection = $stdin.gets.chomp
    system "clear"
    all_hotels.each do |hotel|
      hotel[:rooms_taken] = hotel[:rooms_taken].to_i
      if hotel[:name].upcase == selection.upcase
        hotel[:rooms_taken] += 1
        puts "Booked a room at the #{hotel[:name]} for $#{hotel[:cost]}"
        puts "There are #{hotel[:total_rooms].to_i - hotel[:rooms_taken].to_i} rooms left. "
        @cost = @cost + hotel[:cost].to_i
        gets
      end
    end
    Hotel.wipe_file
    all_hotels.each do |hotel|
      Hotel.add_hotel(hotel)
    end

  end

  def Hotel.get_current_hotels
    all_hotels = []
    CSV.foreach("hotels.csv") do |row|
      hotel = {}
      hotel[:name] = row[0]
      hotel[:address] = row[1]
      hotel[:total_rooms] = row[2]
      hotel[:rooms_taken] = row[3]
      hotel[:cost] = row[4]
      all_hotels << hotel
    end
    return all_hotels
  end

  def Hotel.wipe_file
    #rather than finding and changing a line within a CSV,
    #this method deletes the file and rewrites with the new info.
    File.open("hotels.csv", 'w') {|file| file.truncate(0)}
  end

  def Hotel.settle_bill
    system "clear"
    puts "Would you like to pay the #{@cost} that you owe?"
    print "Y/N > "
    selection = $stdin.gets.chomp
    if selection.upcase == "Y"
      puts "Thank you! Bill settled"
      @cost = 0
    else
      puts "No problem. You still have $#{@cost} outstanding"
    end
  end

end
