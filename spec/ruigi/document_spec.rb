require 'spec_helper'

describe Ruigi::Document do
  context 'When made a Document Object' do
    let(:str) { 'I have a pen but I want to another one' }
    let(:document) { Ruigi::Document.new(str.split) }
    let!(:model) { Ruigi::Model.new([document]) }

    it 'has correct size for feature vector' do
      expect(document.feature_vector.size).to eq(9)
    end
  end
end
