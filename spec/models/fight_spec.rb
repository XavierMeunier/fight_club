require 'rails_helper'

RSpec.describe Fight, type: :model do
  
  it { should validate_presence_of(:winner_punches) }
  it { should validate_presence_of(:looser_punches) }
  it { should validate_presence_of(:victory_type) }
  it { should validate_presence_of(:rounds) }
  it { should validate_presence_of(:winner) }
  it { should validate_presence_of(:looser) }

  it { should belong_to(:winner) }
  it { should belong_to(:looser) }

  it { should validate_numericality_of(:winner_punches) }
  it { should validate_numericality_of(:looser_punches) }
  it { should validate_numericality_of(:rounds) }

end