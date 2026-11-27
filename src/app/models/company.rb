class Company < ApplicationRecord
  self.table_name = "company"
  self.primary_key = "companyid"

  has_many :stocks,
    foreign_key: "companyid"

  has_many :annual_revenue_reports,
    foreign_key: "companyid"

  validates :companyname,
    presence: true,
    uniqueness: true,
    length: {maximum: 150}

  validates :sector,
    presence: true,
    length: {maximum: 100}

end
