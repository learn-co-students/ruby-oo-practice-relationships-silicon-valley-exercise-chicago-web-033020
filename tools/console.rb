require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


# Startup Object Creations
puts "\n"
puts "Startup Object Creations:"
apple = Startup.new("Apple", "Steve Jobs", "www.apple.com")
google = Startup.new("Google", "Some dude", "www.google.com")
microsoft = Startup.new("Microsoft", "Bill Gates", "www.microsoft.com")

amazon = Startup.new("Amazon", "Jeff Bezos", "www.amazon.com")
zillaprints = Startup.new("ZillaPrints", "Enoch Serna", "www.zillaprints.com")


# Startup Object Method 'pivot':
puts "\n"
puts "Startup Object Method 'pivot':"
apple.pivot("www.appleinc.com", "Apple Inc.")

# Startup Class Method 'find_by_founder':
puts "\n"
puts "Startup Class Method 'find_by_founder':"
Startup.find_by_founder("Steve Jobs") # => Apple Inc.

# Startup Class Method 'domains':
puts "\n"
puts "Startup Class Method 'domains':"
p Startup.domains

# Venture Capitalist Object Creations
puts "\n"
puts "Venture Capitalist Creations:"
elon_musk = VentureCapitalist.new("Elon Musk", 1500)
gary_vee = VentureCapitalist.new("Gary Vee", 2000000000)

isaac_medina = VentureCapitalist.new("Isaac Medina", 10000)

# Venture Capitalist Class Method "tres_commas_club"
puts "\n"
puts "Venture Capitalist Class Method 'tres_commas_club':"
VentureCapitalist.tres_commas_club

# Funding Round Object Creations
puts "\n"
puts "Funding Round Creations:"
fr_one = FundingRound.new(apple, gary_vee, "Angel", 50)

isaac_medina.offer_contract(amazon, "Side B", 900)
isaac_medina.offer_contract(zillaprints, "Angel", 500)
isaac_medina.offer_contract(zillaprints, "Side A", 2000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line