# frozen_string_literal: true

class CreateConversions < ActiveRecord::Migration[6.0]
  def change
    create_table :conversions do |t|
      t.string :base_currency
      t.string :target_currency
      t.bigint :base_amount
      t.integer :week_count

      t.timestamps
    end
  end
end
