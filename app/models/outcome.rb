class Outcome < ApplicationRecord
    belongs_to :market

    def price(sess)
        pref = sess[:odds_display] || "american"
        pref == "american" ? american : decimal
    end
end