require_relative "startup.rb"
require_relative "venture_capitalist.rb"


class FundingRound
    attr_reader :startup, :vc, :investment
    attr_accessor :type

    @@all = []

    def initialize(startup, vc, type, investment)
        @startup = startup
        @vc = vc
        @type = type
        @investment = investment.to_f unless investment < 0
        @@all << self
    end

    def self.all
        @@all
    end
end
