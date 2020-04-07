require_relative "venture_capitalist.rb"
require_relative "funding_round.rb"

class Startup

    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(startup_founder)
        self.all.find do |startup|
            if startup.founder == startup_founder
                p startup
            end
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def pivot(new_domain, new_name)
        self.domain = new_domain
        self.name = new_name
    end

    def sign_contract(vc, type_of_investment, amount_invested)
        FundingRound.new(self, vc, type_of_investment, amount_invested)
    end

    def num_funding_rounds
        amount_of_fr = []

        FundingRound.all.select do |fr|
            if fr.startup == self
                amount_of_fr << fr
            end
        end
        p amount_of_fr.count
    end

    def total_funds
        investment_nums = []

        FundingRound.all.select do |fr|
            if fr.startup == self
                investment_nums << fr.investment
            end
        end
        
        p investment_nums.inject(0){ |sum, x| sum + x }
    end

    def investors
        startup_investors = []

        FundingRound.all.select do |fr|
            if fr.startup == self
                startup_investors << fr.vc
            end
        end

        p startup_investors
    end

    def big_investors
        big_investors_array = []

        FundingRound.all.select do |fr|
            if fr.startup == self
                big_investors_array << fr.vc
            end
        end

        startup_big_investor = []

        big_investors_array.map do |investor|
            if investor.total_worth > 1000000000
                startup_big_investor << investor.name
            end
        end

        p startup_big_investor
    end
end