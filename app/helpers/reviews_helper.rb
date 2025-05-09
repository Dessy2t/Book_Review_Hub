module ReviewsHelper
    def display_stars(rating)
      '★' * rating + '☆' * (5 - rating)
    end   
end
