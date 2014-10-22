describe Board do
  let(:board) { Board.new }
  describe "panelsへアクセスが可能" do
    it { expect(board.panels).to be_kind_of Array }
    it { expect(board.panels.first).to be_kind_of Array }
    it { expect(board.panels.first.first).to be_kind_of Panel }
  end
  describe "#panel" do
    let(:pos) { Position.new(0, 0) }
    let(:panel) { Panel.new(pos, Panel::TYPE::EMPTY) }

    it { expect(board.panel(pos).type).to eq(Panel::TYPE::EMPTY) }
    it { expect(board.panel(pos).pos).to eq(panel.pos) }
  end
  describe "#set_panel" do
    let(:pos) { Position.new(0, 0)}
    let(:board) { Board.new }

    it { expect(board.set_panel(pos, Panel::TYPE::WHITE)).to eq Panel.new(pos, Panel::TYPE::WHITE)  }
    it { expect(board.set_panel(pos, Panel::TYPE::BLACK)).to eq Panel.new(pos, Panel::TYPE::BLACK)  }
    it { expect(board.set_panel(pos, Panel::TYPE::EMPTY)).to eq Panel.new(pos, Panel::TYPE::EMPTY)  }
  end
  describe "#reversible?" do
    #     a  b  c  d  e  f  g  h
    # 1 |  |  |  |  |  |  |  |  |
    # 2 |  |  |  |  |  |  |  |  |
    # 3 |  |  |  |  |  |  |  |  |
    # 4 |  |  |  |●|○|  |  |  |
    # 5 |  |  |  |○|●|  |  |  |
    # 6 |  |  |  |  |  |  |  |  |
    # 7 |  |  |  |  |  |  |  |  |
    # 8 |  |  |  |  |  |  |  |  |
    context "初期盤面" do
      let(:pos_3d) { Position.parse "3 d" }
      let(:pos_4c) { Position.parse "4 c" }
      let(:pos_6d) { Position.parse "6 d" }
      let(:pos_3g) { Position.parse "3 g" }

      it { expect(board.reversible?(pos_3d, Panel::TYPE::BLACK)).to be true }
      it { expect(board.reversible?(pos_4c, Panel::TYPE::BLACK)).to be true }
      it { expect(board.reversible?(pos_6d, Panel::TYPE::BLACK)).to be false }
      it { expect(board.reversible?(pos_3g, Panel::TYPE::BLACK)).to be false }
    end
  end
end
