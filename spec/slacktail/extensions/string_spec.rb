require 'spec_helper'

describe String do
  describe '#to_colsole_color' do
    it "converts rrggbb to colsole-compatible color stirng" do
      expect("ff0000".to_colsole_color).to eq :r
    end

    context "with a color that does not have direct match" do
      it "returns the closest match" do
        expect("cc2233".to_colsole_color).to eq :r
      end
    end
  end
end
