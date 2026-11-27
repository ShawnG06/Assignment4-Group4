class StockSearchQuery < ApplicationQuery
  def call(search: "")
    sql = <<-SQL
        SELECT
        s.tickersymbol,
        c.companyname,
        c.sector,
        s.exchange
      FROM stocks AS s
      JOIN company AS c
        ON c.companyid = s.companyid
      WHERE
        s.tickersymbol ILIKE $1
        OR c.companyname ILIKE $1
      ORDER BY s.tickersymbol
      LIMIT 100;
    SQL

    term = ActiveRecord::Base.sanitize_sql_like(
      search.to_s.strip
    )

    select(
      sql,
      [bind("search", "%#{term}")]
    )
  end

end
