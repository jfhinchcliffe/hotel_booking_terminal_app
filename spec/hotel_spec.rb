require 'hotel'
describe Hotel do

  p = Hotel.new("date1", "date2")
  puts "ARRIVING #{p.arriving}"

  describe "find_room" do
    context "When method is called" do
      it "returns a string letting me know where I am" do
        expect(p.find_room()).to eq("In the find room method")
      end
    end
  end

  # describe "Checking value returns" do
  #   context "When I ask for the arrival and departure dates" do
  #     it "returns strings letting me know the dates" do
  #       expect (p.arriving).to include("date1")
  #       expect (p.arriving).to include("date2")
  #     end
  #   end
  # end

end
