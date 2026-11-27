class AnnualRevenueReport < ApplicationRecord
  self.table_name = "annualrevenuereport"
  self.primary_key = "revenueid"

  belongs_to :company,
    foreign_key: "companyid"

  has_man :revenue_analyses,
    foreign_key: "revenueid"

  has_many :ai_analyses,
    through: revenue_analyses

  validates :fiscalyear,
    numericality: { only_integer: true, greater_than_or_equal_to: 1900  }

  validates :fiscalyear,
    uniqueness: { scope: :companyid  }

  validates :totalrevenue,
    numericality: { greater_than_or_equal_to: 0  }

  validates :currency,
    format: { with: /\A[A-Z]{3}\z/  }

end
