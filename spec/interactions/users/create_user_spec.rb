require 'rails_helper'

RSpec.describe CreateUser do
  let(:valid_user_params) do
    {
      age: 25,
      country: 'Россия',
      email: 'user@example.com',
      gender: 'male',
      name: 'Иван',
      nationality: 'русский',
      patronymic: 'Иванович',
      surname: 'Иванов',
      interests: %w[интерес1 интерес2],
      skills: %w[навык1 навык2]
    }
  end

  describe '.execute' do
    context 'valid params' do
      let(:valid_user) { described_class.run!(params: valid_user_params) }

      context 'successfully' do
        it('creates user') { expect(described_class.run!(params: valid_user_params).persisted?).to be_truthy }
        it('has interests') { expect(valid_user.interests.size).to eq(2) }
        it('has skills') { expect(valid_user.skills.size).to eq(2) }
        it 'has all needed params' do
          expect(described_class.run!(params: valid_user_params.except(:interests, :skills)).valid?).to be_truthy
        end
      end

      context 'failed' do
        it 'has error on email duplicate' do
          expect(valid_user.persisted?).to be_truthy

          user = described_class.run!(params: valid_user_params)
          expect(user.persisted?).to be_falsey
          expect(user.errors.first).is_a? ActiveModel::Error
        end
      end
    end

    context 'invalid params' do
      it 'raise error if a required parameter is missing' do
        valid_user_params.except(:interests, :skills).keys.each do |key|
          params = valid_user_params.except(:interests, :skills, key)
          expect { described_class.run!(params:) }.to raise_error(ActiveInteraction::InvalidInteractionError)
        end
      end

      it 'has error on wrong age' do
        params = valid_user_params
        [ -1, 0, 91 ].each do |num|
          params[:age] = num
          expect(described_class.run!(params:).errors).to be_present
        end
      end
    end
  end
end
