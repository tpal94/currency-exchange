# frozen_string_literal: true

json.extract! conversion, :id, :base_currency, :target_currency, :base_amount, :target_amount, :created_at, :updated_at
json.url conversion_url(conversion, format: :json)
