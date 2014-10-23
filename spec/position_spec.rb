require 'spec_helper'
require 'position'

describe Position do
  it "座標を表すx,yに外部からアクセスできる" do
    pos = Position.new(1,2)
    expect(pos.x).to eq(1)
    expect(pos.y).to eq(2)
  end

  describe "'3 e'のように盤面表示の入力を2次元配列のindexへ変換できる" do
    context "3 e" do
     it { expect(Position.parse "3 e").to eq(Position.new(4, 2)) }
    end
    context "3 E" do
      it { expect(Position.parse "3 E").to eq(Position.new(4, 2)) }
    end
    context "a 4" do
      it { expect(Position.parse "a 4").to eq(Position.new(0, 3)) }
    end
    context "3e" do
      it { expect(Position.parse "3e").to eq(Position.new(4, 2)) }
    end
    context "(3, f)" do
      it { expect(Position.parse "(3, f)").to eq(Position.new(5, 2)) }
    end
    context "(3,f)" do
      it { expect(Position.parse "(3,f)").to eq(Position.new(5, 2)) }
    end
    context "(f,3)" do
      it { expect(Position.parse "(f,3)").not_to eq(Position.new(3, 3)) }
    end
  end

  let(:pos) { Position.new(1, 2) }
  describe "up" do
    context "盤面の中の移動" do
      it { expect(pos.up).to eq(Position.new(1, 1)) }
    end

    context "盤面外へ出てしまう移動" do
      let(:pos) { Position.new(1, 0) }
      it { expect(pos.up).to be nil }
    end
  end
  describe "down" do
    context "盤面の中の移動" do
      it { expect(pos.down).to eq(Position.new(1, 3)) }
    end

    context "盤面外へ出てしまう移動" do
      let(:pos) { Position.new(1, Board::SIZE-1) }
      it { expect(pos.down).to be nil }
    end
  end
  describe "right" do
    context "盤面の中の移動" do
      it { expect(pos.right).to eq(Position.new(2, 2)) }
    end

    context "盤面外へ出てしまう移動" do
      let(:pos) { Position.new(Board::SIZE-1, 1) }
      it { expect(pos.right).to be nil }
    end
  end
  describe "left" do
    context "盤面の中の移動" do
      it { expect(pos.left).to eq(Position.new(0, 2)) }
    end

    context "盤面外へ出てしまう移動" do
      let(:pos) { Position.new(0, 1) }
      it { expect(pos.left).to be nil }
    end
  end

  describe "==" do
    context "一致になるケース" do
      it { expect(Position.new(1, 2)).to eq(Position.new(1, 2)) }
    end
    context "不一致になるケース" do
      it { expect(Position.new(5, 2)).not_to eq(Position.new(1, 2)) }
      it { expect(Position.new(1, 4)).not_to eq(Position.new(1, 2)) }
    end
  end
end
