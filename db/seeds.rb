class Seed

  def self.begin
    seed = Seed.new
    seed.generate_states
  end

  def generate_states
    20.times do |i|
      state = State.create!(
        name: Faker::Nation.capital_city
      )
      5.times do |index|
          review = state.reviews.create!(
          author: Faker::TvShows::Seinfeld.character,
          review: Faker::TvShows::Seinfeld.quote,
          rating: rand(1...5)
        )
        state.save
        puts "State #{i}."
      end
    end
  end
end

Seed.begin
