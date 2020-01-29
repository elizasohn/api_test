class Seed
    def self.begin(count = 20)
        e
        generate_reviews(count)
    end

    private
    def self.e
        Review.destroy_all
    end

    def self.generate_reviews(count)
        count.times do |i|
            review = Review.create!(
                content: Faker::Quote.famous_last_words,
                city: Faker::Address.city,
                country: Faker::Address.country
            )
            puts "Review #{i}: Place is #{review.city}, #{review.country}. Review is '#{review.content}'"
        end
    end
end

Seed.begin
