# frozen_string_literal: true

require 'rails_helper'

describe InformationProvider do
  subject { described_class.new }

  describe '#inventory_items' do
    it 'returns inventory items' do
      expect(subject.inventory_items.class).to eq(Array)
    end
  end

  describe '#my_sell_offers' do
    it 'returns my sell offers' do
      expect(subject.my_sell_offers.class).to eq(Array)
    end
  end
end
