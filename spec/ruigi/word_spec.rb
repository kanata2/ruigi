require 'spec_helper'

describe Ruigi::Word do
  context 'When made a model' do
    let(:document) do
      str = 'I have a pen but I want to another one'
      Ruigi::Document.new('sample', str.split)
    end

    it 'is counted correctly' do
      expect(document.words['I'].count).to eq(2)
      expect(document.words['I'].tf).to eq(0.2)
    end
  end
end
