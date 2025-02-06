# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RescueUniqueConstraint do
  let(:thing) { Thing.create(name: 'foo', code: 123, score: 1000) }
  let(:another_thing) { Thing.new }

  before { thing }
  after { Thing.destroy_all }

  context 'when single field value is duplicated' do
    before do
      another_thing.name = 'foo'
      another_thing.save
    end

    it 'does not save' do
      expect(another_thing.persisted?).to be false
    end

    it 'adds an error message to the defined attribute' do
      expect(another_thing.errors[:name].first).to match(/has already been taken/)
    end
  end

  context 'when multiple field value is duplicated' do
    before do
      another_thing.score = 1000
      another_thing.code = 123
      another_thing.save
    end

    it 'does not save' do
      expect(another_thing.persisted?).to be false
    end

    it 'adds an error message to the defined attribute' do
      expect(another_thing.errors[:score].first).to match(/has already been taken/)
    end
  end
end
