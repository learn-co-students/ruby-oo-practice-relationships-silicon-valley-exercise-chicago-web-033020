class Startup
  attr_reader :founder 
  attr_accessor :domain, :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot (name, domain)
    self.name = name
    self.domain = domain
  end

  def self.find_by_name(founder_name)
    self.all.find { |startup| startup.founder == founder_name }
  end

  def self.domains
    self.all.map { |startup| startup.domain }
  end

  def sign_contract(venture_capitalist, investment_type, amount_invested)
    FundingRound.new(self, venture_capitalist, investment_type, amount_invested)
  end

  # Helper method that selects all funding rounds for a particular start-up
  def funding_rounds
    FundingRound.all.select { |round| round.startup == self }
  end

  def num_funding_rounds
    self.funding_rounds.length
  end

  def total_funds
    self.funding_rounds.map { |round| round.investment }.reduce(:+)
  end

  def investors
    self.funding_rounds.map { |round| round.venture_capitalist}.uniq
  end

  def big_investors
    self.investors.select { |investor| investor.total_worth > 1000000000 }
  end

end
