require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  context 'when user invalid' do
    it { expect(user.save).to be_falsey }
  end

  context 'when user is valid' do
    it 'with set valid password' do
      user.update(password: '123456', password_confirmation: '123456')
      expect(user.save).to be_truthy
    end
  end
end
