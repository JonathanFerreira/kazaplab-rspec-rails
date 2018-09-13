require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build_stubbed :user }

  it { is_expected.to be_instance_of(User) }

  it { expect(described_class.ancestors).to include ApplicationRecord }
end
