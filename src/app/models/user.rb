class User < ApplicationRecord
  self.table_name = "users"
  self.primary_key = "email"

  belongs_to :role,
    foreign_key: "rolename"

  has_many :transactions,
    foreign_key: "email"

  has_many :stocks,
    through :holdings
  
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format:{with: URI::MailTo::EMAIL_REGEXP}
    length: {maximum: 255}

  validates :passwordhash,
    presence: true

  validates :balance,
    numericality: { 
      greater_than_or_equal_to: 0  
    }

end
