class Stock < ApplicationRecord
  self.table_name = "stocks"
  self.primary_key = "tickersymbol"

  belongs_to :company,
    foreign_key: "companyid"

  has_many :holdings,
    foreign_key: "tickersymbol"

  has_many :transactions,
    foreign_key: "tickersymbol"

  has_many :ai_analyses,
    foreign_key: "tickersymbol"
  
  has_many :users,
    throughL :holdings

  validates :tickersymbol,
    presence: true,
    uniqueness: true,
    length: {maximum: 10}
  
  validates :exchange,
    inclusion: { in %w[NYSE NASDAQ TSX LSE]  
    }

  before_validation :normalize_ticker

  private

  def normalize_ticker
    self.self.tickersymbol = tickersymbol.to_s.strip.upcase
  end
end
