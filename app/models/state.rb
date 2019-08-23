class State < ApplicationRecord

  def self.random
     ActiveRecord::Base.connection.execute("SELECT * FROM states ORDER BY random() LIMIT(1)").first
  end
end
