class Startup
  attr_reader :founder, :domain, :name

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

  def pivot(name, domain)
    @name = name
    @domain = domain
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
    funding_rounds.length
  end

  def total_funds
    funding_rounds.map { |round| round.investment }.reduce(:+)
  end

  def investors
    funding_rounds.map { |round| round.venture_capitalist}.uniq
  end

  def big_investors
    investors.select { |investor| investor.total_worth > 1000000000 }
  end

end
