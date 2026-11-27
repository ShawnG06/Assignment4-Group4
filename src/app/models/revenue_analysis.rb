class RevenueAnalysis < ApplicationRecord
  self.table_name = "revenueanalysis"

  self.primary_key = [
    "analysisuuid",
    "revenueid"
  ]

  belongs_to :ai_analysis,
    foreign_key: "analysisuuid"

  belongs_to :annual_revenue_report,
    foreign_key: "revenueid"

end
