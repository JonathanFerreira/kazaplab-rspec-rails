require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build_stubbed :post }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_length_of(:title).is_at_most(100) }
end
