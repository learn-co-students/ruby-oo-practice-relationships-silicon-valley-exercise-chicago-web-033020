class VentureCapitalist
  attr_accessor :name, :total_worth, :tres_commas_club
  @@all = []
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    if @total_worth > 1000000000.0
      @tres_commas_club = "Y"
    else
      @tres_commas_club = "N"
    end
    self.class.all << self
  end

  def offer_contract(startup, type, investment)
    sign = FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    all_funding_rounds
  end

  def portfolio
    all_funding_rounds.map{|f| f.startup}.uniq
  end

  def biggest_investment
    funding = all_funding_rounds
    funding.max_by{|f|f.investment}
  end

  def invested(domain)
    all_funding_rounds.select{|f|f.startup.domain == domain}.sum{|s|s.investment}
  end

  def all_funding_rounds
    FundingRound.all.select{|f| f.venture_capitalist == self}
  end

  def self.tres_commas_club
    self.all.select{|vc|vc.tres_commas_club == "Y"}
  end

  def self.all
    @@all
  end
end
