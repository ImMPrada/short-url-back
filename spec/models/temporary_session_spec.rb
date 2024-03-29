require 'rails_helper'

RSpec.describe TemporarySession, type: :model do
  describe 'validations' do
    describe 'when creating a new TemporarySession' do
      it 'adds a UUID to the record' do
        session = create(:temporary_session)
        expect(session.uuid).to be_present
      end
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:registered_urls).dependent(:nullify) }
  end
end
