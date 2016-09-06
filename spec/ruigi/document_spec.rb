require 'spec_helper'

describe Ruigi::Document do
  context 'When made a Document Object' do
    let(:document) do
      str = 'I have a pen but I want to another one'
      Ruigi::Document.new('sample', str.split)
    end
    let!(:model) do
      Ruigi::Model.new([document])
    end

    it 'has correct size for feature vector' do
      expect(document.feature_vector.size).to eq(9)
    end
  end
end
