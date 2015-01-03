require 'spec_helper'

describe 'Hello' do
  it "message return hello" do
    expect(Hello.new.message).to eq "hello"
  end
end

describe '四則演算' do
  describe '足し算' do
    it '1 + 1 は 2 になること' do
      expect(1 + 1).to eq 2
    end
  end
  describe '引き算' do
    it '10 - 1  は 9 になること' do
      expect(10 - 1).to eq 9
    end
  end
end

describe 'matcher sample' do
  it '1 + 2 は ３ になること' do
    expect(1 + 2).to eq 3
  end
  it '[1, 2, 3] は 2 を含むこと' do
    expect([1, 2, 3]).to include 2
  end
  it '[] は 空であること' do
    expect([]).to be_empty
  end

  it 'nil でなければ true とみなされること' do
    expect(1).to be_truthy
  end
  it 'nil であれば false とみなされること' do
    expect(nil).to be_falsey
  end
#   it 'error1' do
#     expect(1).to eq true
#   end
#   it 'error2' do
#     expect(nil).to eq false
#   end

  it 'pop で 1つ減ること' do
    x = [1, 2, 3]
    expect{ x.pop }.to change{ x.size }.from(3).to(2)
  end
  it 'push で 1つ増えること' do
    x = [1, 2, 3]
    expect{ x.push 10 }.to change{ x.size }.from(3).to(4)
  end

  it '0で除算するとエラーが起きること' do
    expect{ 1 / 0 }.to raise_error ZeroDivisionError
  end
end
