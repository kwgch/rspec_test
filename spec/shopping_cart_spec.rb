require 'spec_helper'

describe ShoppingCart do
  it 'nilを追加するとエラーが発生すること' do
    cart = ShoppingCart.new
    expect{ cart.add nil }.to raise_error 'Item is nil.'
  end
end