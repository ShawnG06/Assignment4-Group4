class Transaction < ApplicationRecord
  self.table_name = "transactions"
  self.primary_key = "id"

  belongs_to :user,
    foreign_key: "email"

  belongs_to :stock,
    foreign_key: "tickersymbol"

  validates :transactiontype,
    inclusion: { in %W[BUY SELL]  }

  validates :quantity, numericality: { greater_than: 0  }

  validates :price,
    numericality: { greater_than: 0  }

end
