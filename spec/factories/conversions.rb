# frozen_string_literal: true

FactoryBot.define do
  factory :conversion do
    base_currency {"EUR"}
    target_currency { "INR" }
    week_count { 5 }
    base_amount { 5 }
  end
end
