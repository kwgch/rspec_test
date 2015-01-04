describe User do
  shared_context '12歳の場合' do
    let(:age) { 12 }
  end
  shared_context '13歳の場合' do
    let(:age) { 13 }
  end
  describe '#greet' do
    let(:user) { User.new(name: 'たろう', age: age) }
    subject { user.greet }
    shared_examples '子どものあいさつ' do
      it { is_expected.to eq 'ぼくはたろうだよ。' }
    end
    context '0歳の場合' do
      let(:age) { 0 }
      it_behaves_like '子どものあいさつ'
    end
    context '12歳の場合' do
      include_context '12歳の場合'
      it_behaves_like '子どものあいさつ'
    end
    shared_examples '大人のあいさつ' do
      it { is_expected.to eq '僕はたろうです。' }
    end
    context '13歳の場合' do
      include_context '13歳の場合'
      it_behaves_like '大人のあいさつ'
    end
    context '100歳の場合' do
      let(:age) { 100 }
      it_behaves_like '大人のあいさつ'
    end
  end
  describe '#child?' do
    let(:user) { User.new(name: 'たろう', age: age) }
    subject { user.child? }
    context '12歳以下の場合' do
      include_context '12歳の場合'
      it { is_expected.to eq true }
    end
    context '13歳以上の場合' do
      include_context '13歳の場合'
      it { is_expected.to eq false }
    end
  end

  describe '#save_profile' do
    let(:user){ double('User') }
    it '特定のユーザー名、特定のメールアドレス' do
      expect(user).to receive(:save_profile).with('Alice', 'alice@example.com')
      user.save_profile('Alice', 'alice@example.com')
    end
    it '特定のユーザー名、不特定のメールアドレス' do
      expect(user).to receive(:save_profile).with('Alice', anything)
      user.save_profile('Alice', 'something')
    end
    it 'ハッシュを引数として渡す場合' do
      expect(user).to receive(:save_profile).with(name: 'Alice', email: 'alice@example.com')
      user.save_profile(name: 'Alice', email: 'alice@example.com')
    end
    it 'ハッシュ全体ではなく、特定のkeyとvalueだけに着目する場合' do
      expect(user).to receive(:save_profile).with(hash_including(name: 'Alice'))
      user.save_profile(name: 'Alice', some_key: 'some_value')
    end
  end
end