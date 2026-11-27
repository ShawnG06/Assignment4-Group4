class Holding < ApplicationRecord
  self.table_name = "holdings"

  self.primary_key = [
    "email",
    "tickersymbol"
  ]

  belongs_to :user,
    foreign_key: "email"

  belongs_to :stock,
    foreign_key: "tickersymbol"

  validates :quantity,
    numericality: { greater_than_or_equal_to: 0  }

  validates :averageprice,
    numericality: { greater_than_or_equal_to: 0  }

  validates :holdingsname,
    length: {maximum: 100},
    allow_nil: true

end
