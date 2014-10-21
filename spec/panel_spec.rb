require 'panel'
require 'position'

describe Panel do
  let(:pos)  { Position.new(0, 0) }
  let(:empty) { Panel.new(pos, Panel::TYPE::EMPTY) }
  let(:black) { Panel.new(pos, Panel::TYPE::BLACK) }
  let(:white) { Panel.new(pos, Panel::TYPE::WHITE) }

  describe "#black?" do
    context "パネルに石が置かれていない時" do
      it { expect(empty.black?).to be false }
    end
    context "パネルに黒の石が置かれている時" do
      it { expect(black.black?).to be true }
    end
    context "パネルに白の石が置かれている時" do
      it { expect(white.black?).to be false }
    end
  end

  describe "#white?" do
    context "パネルに石が置かれていない時" do
      it { expect(empty.white?).to be false }
    end
    context "パネルに黒の石が置かれている時" do
      it { expect(black.white?).to be false }
    end
    context "パネルに白の石が置かれている時" do
      it { expect(white.white?).to be true }
    end
  end

  describe "#empty?" do
    context "パネルに石が置かれていない時" do
      it { expect(empty.empty?).to be true }
    end
    context "パネルに黒の石が置かれている時" do
      it { expect(black.empty?).to be false }
    end
    context "パネルに白の石が置かれている時" do
      it { expect(white.empty?).to be false }
    end
  end
end
