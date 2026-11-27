class Role < ApplicationRecord
  self.table_name = "roles"
  self.primary_key = "rolename"

  has_many :users,
    foreign_key: "rolename"

  validates :rolename,
    presence: true,
    uniqueness: true,
    length: {maximum: 30}

end
