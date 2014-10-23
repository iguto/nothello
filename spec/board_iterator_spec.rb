require 'board'

describe PanelIterator do
  let(:board) { Board.new }
  let(:panel_iterator) { PanelIterator.new(board.panels) }

  describe "#panel" do
    let(:pos) { Position.parse("4 d") }

    it { expect(panel_iterator.panel).to be_kind_of Panel }
    it { expect(panel_iterator.panel(pos)).to be_kind_of Panel }
  end

  describe "#set_pos"

  describe "#up" do
    before { panel_iterator.set_pos pos }
    context "盤面外へ移動してしまう場合" do
      let(:pos) { Position.new(0, 0) }
      it { expect(panel_iterator.up).to be nil }
    end

    context "盤面内の移動の場合" do
      let(:pos) { Position.new(1, 1) }
      it { expect(panel_iterator.up).to be_kind_of Panel }
    end
  end
  describe "#down" do
    before { panel_iterator.set_pos pos }
    context "盤面外へ移動してしまう場合" do
      let(:pos) { Position.new(1, Board::SIZE-1) }
      it { expect(panel_iterator.down).to be nil }
    end

    context "盤面内の移動の場合" do
      let(:pos) { Position.new(1, 1) }
      it { expect(panel_iterator.down).to be_kind_of Panel }
    end
  end
  describe "#right" do
    before { panel_iterator.set_pos pos }
    context "盤面外へ移動してしまう場合" do
      let(:pos) { Position.new(Board::SIZE-1, 1) }
      it { expect(panel_iterator.right).to be nil }
    end

    context "盤面内の移動の場合" do
      let(:pos) { Position.new(0, 1) }
      it { expect(panel_iterator.right).to be_kind_of Panel }
    end
  end
  describe "#left" do
    before { panel_iterator.set_pos pos }
    context "盤面外へ移動してしまう場合" do
      let(:pos) { Position.new(0, 1) }
      it { expect(panel_iterator.left).to be nil }
    end

    context "盤面内の移動の場合" do
      let(:pos) { Position.new(1, 1) }
      it { expect(panel_iterator.left).to be_kind_of Panel }
    end
  end
end
