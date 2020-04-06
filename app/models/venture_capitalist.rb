class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.tres_commas_club
    self.all.select { |venture| venture.total_worth > 1000000000 }
  end

  def offer_contract(startup, investment_type, amount_invested)
    FundingRound.new(startup, self, investment_type, amount_invested)
  end

  # Helper method that retrieves all funding rounds for the relevant venture_capitalist instance
  def funding_rounds
    FundingRound.all.select { |round| round.venture_capitalist == self }
  end

  def portfolio
    self.funding_rounds.map { |round| round.startup}.uniq
  end

  def biggest_investment
    self.funding_rounds.map { |round | round.investment}.max
  end

  def invested(domain)
    total = self.funding_rounds.select { |round| round.startup.domain == domain }
    total.map { |round| round.investment }.reduce(:+)
  end

end