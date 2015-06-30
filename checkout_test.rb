require "minitest/autorun"
require_relative 'checkout'

describe Checkout do
  before do
    @checkout = Checkout.new
  end

  describe "when scaning 2x1" do
    before do
      @price = 3.11
      @items = %w(AM AM)
    end

    it "should return half price" do
      @items.each { |item| @checkout.scan(item) }
      @checkout.total.must_equal @price
    end
  end

  describe "when scaning normal products" do
    before do
      @items = %w(CA CA CA)
      @price = 33.69
    end

    it 'should return the sum of their prices' do
      @items.each { |item| @checkout.scan(item) }
      @checkout.total.must_equal @price
    end
  end

  describe "when scaning 3 2X1 items" do
    before do
      @items = %w(AM AC AM AM CA)
      @price = 22.45
    end

    it 'should charge 2 of them' do
      @items.each { |item| @checkout.scan(item) }
      @checkout.total.must_equal @price
    end
  end
 
  describe "when scaning 3+ discount items" do
    before do
      @items = %w(AC AC AM AC)
      @price = 16.61
    end

    it 'should charge discounted for every of them' do
      @items.each { |item| @checkout.scan(item) }
      @checkout.total.must_equal @price
    end
  end
end
