require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

vcap1 = VentureCapitalist.new("Gates", 900000000.00)
vcap2 = VentureCapitalist.new("Jobs", 2300000000.00)
vcap3 = VentureCapitalist.new("Dude", 500000.00)

p VentureCapitalist.all

# p vcap1.name
# p vcap2.total_worth
# p VentureCapitalist.all

stp1 = Startup.new("First Startup", "Joe", "Drone tech")
stp2 = Startup.new("Second Startup", "Dave", "Biotech")
stp3 = Startup.new("Third Startup", "Jane", "Nono tech")
stp3.pivot("Nanite tech", "New Startup")
p stp3
# p stp1.name
# p stp2.founder
# p stp3.domain
# p Startup.all

fundr1 = stp1.sign_contract(vcap1, "Seed", 250000.00)
fundr2 = vcap2.offer_contract(stp2, "Angel", 50000.00)
fundr3 = vcap2.offer_contract(stp1, "Pre-seed", 20000.00)
fundr4 = vcap2.offer_contract(stp1, "Series A", 30000.00)

p fundr1.investment
p fundr1.venture_capitalist
p fundr2.type
p fundr2.startup

p stp1.num_funding_rounds
p stp1.total_funds
# p vcap2.funding_rounds
p vcap2.portfolio
p vcap2.biggest_investment
p vcap2.invested("Drone tech")

p VentureCapitalist.tres_commas_club

p Startup.find_by_founder("Jane")

p Startup.domains

# p stp1.investors
# p stp1.big_investors
# p FundingRound.all
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line