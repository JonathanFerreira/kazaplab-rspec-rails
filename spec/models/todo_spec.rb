require 'rails_helper'

RSpec.describe Todo, type: :model do
  subject { build :todo }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_most(200) }
end
