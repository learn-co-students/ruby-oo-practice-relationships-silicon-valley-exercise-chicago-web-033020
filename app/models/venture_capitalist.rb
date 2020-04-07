require_relative "startup.rb"
require_relative "funding_round.rb"

class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        vc_tres_commas_club = []

        self.all.select do |vc|
            if vc.total_worth >= 1000000000
                vc_tres_commas_club << vc
            end
        end
        p vc_tres_commas_club
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        funding_rounds_included = []

        FundingRound.all.each do |fr|
            if fr.vc == self
                funding_rounds_included << fr
            end
        end
        p funding_rounds_included
    end

    def portfolio
        unique_startups_funded = []

        self.funding_rounds.each do |fr|
            if fr.vc == self
                unique_startups_funded << fr.startup
            end
        end

        p unique_startups_funded.uniq
    end

    def biggest_investment
        sorted_biggest_investment = FundingRound.all.sort_by do |fr|
            fr.investment
        end

        p sorted_biggest_investment.last(1)
    end

    def invested(startup_domain)
        invested_amounts = []

        FundingRound.all.each do |fr|
            if fr.startup.domain == startup_domain && fr.vc == self
                invested_amounts << fr.investment
            end
        end

        p invested_amounts.inject(0){ |sum, x| sum + x }
    end
end
