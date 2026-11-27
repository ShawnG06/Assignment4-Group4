class AiAnalysis < ApplicationRecord
  self.table_name = "aianalysis"
  self.primary_key = "analysisuuid"
  
  belongs_to :stock,
    foreign_key: "tickersymbol"

  has_many :revenue_analyses,
    foreign_key: "analysisuuid"

  has_many :annual_revenue_reports,
    through :revenue_analyses

  validates :predictedprice,
    numericality: { greater_than: 0  }

  validates :recommendation,
    inclusion: {
      in: %W[BUY SELL HOLD]
    }

  validates :modelaccuracy,
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1  }

  validates :reasoning,
    presence: true

end
