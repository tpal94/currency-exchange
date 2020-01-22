# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversion, type: :model do
  before do
    @conversion = FactoryBot.build(:conversion)
  end

  it "has a valid factory" do
    expect(@conversion).to be_valid
  end
end
