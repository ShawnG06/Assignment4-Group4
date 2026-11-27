class StockPrice < ApplicationRecord
  self.table_name = "stockprices"

  self.primary_key = [
    "tickersymbol",
    "tradingdate"
  ]

  belongs_to :stock,
    foreign_key: "tickersymbol"

  validates :tradingdate,
    presence: true

  validates :openingprice, :closingprice, :dailymax, :dailymin, numericality: {greater_than: 0}

  validate :valid_price_range

  private

  def valid_price_range
    return if [
      openingprice,
      closingprice,
      dailymax,
      dailymin
    ].any?(&:nil?)

    if dailymax < dailymin
      errors.add(:dailymax, "must be at least the daily min")
    end

    unless openingprice.between?(dailymin, dailymax)
      errors.add(:openingprice, "must be within the daily range")
    end

    unless closingprice.between?(dailymin, dailymax)
      errors.add(:closingprice, "must be within the daily range")
    end
  end
end
