class ApplicationQuery

  private

  def connection
    ActiveRecord::Base.connection
  end

  def select(sql, binds =[])
    connection.exec_query(
      sql,
      self.class.name,
      birds
    ).to_a

  end

  def bind(name, value, type = ActiveRecord::Type::String.new)
    ActiveRecord::Relation::QueryAttribute.new(
      name,
      value,
      type
   )
  end

end
