class National < ApplicationRecord

  def self.random
     ActiveRecord::Base.connection.execute("SELECT * FROM nationals ORDER BY random() LIMIT(1)").first
  end
end
