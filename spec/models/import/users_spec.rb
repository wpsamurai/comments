require 'rails_helper'

RSpec.describe Import::Users, type: :import do
  subject(:users) { described_class }

  let(:logger) { Import::Logger.new }

  context 'when there are users to import' do
    let(:source) do
      instance_double(
        Import::Sources::JsonPlaceholder::Source,
        users: [
          {
            name: 'Some name',
            username: 'Some username',
            email: 'Some email',
            external_id: 'abc'
          }
        ]
      )
    end

    it 'creates user' do
      expect { users.import(source) }.to change(User, :count).from(0).to(1)
    end

    it 'does not return any errors' do
      users.import(source, logger)

      expect(logger.messages[:errors].count).to eq 0
    end
  end

  context 'when there are no users to import' do
    let(:source) { instance_double(Import::Sources::JsonPlaceholder::Source, users: []) }

    it 'does not return any errors' do
      users.import(source, logger)

      expect(logger.messages[:errors].count).to eq 0
    end

    it 'does not change the users number' do
      expect { users.import(source) }.not_to change(User, :count)
    end
  end

  context 'when user with given external_id already exists' do
    let(:external_id) { 'abc' }
    let(:source) do
      instance_double(
        Import::Sources::JsonPlaceholder::Source,
        users: [
          {
            name: 'Some name',
            username: 'Some username',
            email: 'Some email',
            external_id: external_id
          }
        ]
      )
    end

    before do
      FactoryBot.create(:user, external_id: external_id)
    end

    it 'does not import user again' do
      expect { users.import(source) }.not_to change(User, :count)
    end
  end
end
