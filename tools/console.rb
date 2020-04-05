require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

deliveroo = Startup.new("Deliveroo", "Sam Gorick", "www.deliveroo.com")
ben = Startup.new("A few Ben", "Claire Gorick", "www.compandben.com")

claire = VentureCapitalist.new("Claire Dalling", 1000000000000)
sam = VentureCapitalist.new("Sam", 5000)

deliveroo.sign_contract(claire, "angel", 50000)
deliveroo.sign_contract(sam, "angel", 10)
deliveroo.sign_contract(sam, "angel", 10)
deliveroo.sign_contract(sam, "angel", 10)
deliveroo.sign_contract(sam, "angel", 10)
deliveroo.sign_contract(sam, "angel", 10)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line