# frozen_string_literal: true

require 'pry'
require 'rails_helper'

describe ItemActualizer do
  subject { described_class.new }

  # describe 'item_is_main? for clean item' do
  #    let(:item) { {"classid"=>"1814257415", "instanceid"=>"57949762", "hash_name"=>"Peregrine Flight", "price"=>80.26, "time"=>"1556118240", "id"=>"101120193"} }

  #   it 'returns true' do
  #     # binding.pry
  #     expect(subject.item_is_main?(item)).to eq(true)
  #   end
  # end

  describe 'item_is_main? for items with Rune' do
     let(:item) { {"classid"=>"2274821247", "instanceid"=>"253033329", "hash_name"=>"Inscribed Staff of Gun-Yu", "price"=>82.41, "time"=>"1556118184", "id"=>"101120085"} }

    it 'returns false' do
      expect(subject.item_is_main?(item)).to eq(false)
    end
  end

  # describe 'item_is_main? for items with empty slot' do
  #    let(:item) { {"classid"=>"1880238739", "instanceid"=>"230145964", "hash_name"=>"Hydrakan Latch", "price"=>82.41, "time"=>"1556118184", "id"=>"101120085"} }

  #   it 'returns false' do
  #     expect(subject.item_is_main?(item)).to eq(false)
  #   end
  # end


  # describe 'item_is_main? for items with gift message' do
  #    let(:item) { {"classid"=>"2978690321", "instanceid"=>"3091988023", "hash_name"=>"Staff of Gun-Yu", "price"=>82.41, "time"=>"1556118184", "id"=>"101120085"} }

  #   it 'returns false' do
  #     expect(subject.item_is_main?(item)).to eq(false)
  #   end
  # end
end
