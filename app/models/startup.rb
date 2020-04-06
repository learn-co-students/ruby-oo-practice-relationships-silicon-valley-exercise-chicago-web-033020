class Startup
  attr_accessor :name, :founder, :domain
  @@all = []
  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    self.class.all << self
  end

  def pivot(new_domain, new_name)
    self.domain = new_domain
    self.name = new_name
  end

  def sign_contract(venture_capitalist, type, investment)
    sign = FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    all_funding_rounds.size
  end

  def total_funds
    all_funding_rounds.sum{|f|f.investment}
  end

  def investors
    all_funding_rounds.map{|f| f.venture_capitalist}.uniq
  end

  def big_investors
    funding = all_funding_rounds.select{|f| f.venture_capitalist.tres_commas_club == "Y"}
    funding.map{|fd|fd.venture_capitalist}.uniq
  end

  def all_funding_rounds
    FundingRound.all.select{|f| f.startup == self}
  end

  def self.find_by_founder(founder)
    self.all.find{|stp|stp.founder == founder}
  end

  def self.domains
    self.all.map{|stp| stp.domain}
  end
  
  def self.all
    @@all
  end

end
