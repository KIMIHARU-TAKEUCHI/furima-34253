require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

context '出品ができる時' do

  it "必須項目が全てあれば登録できること" do
    expect(@item).to be_valid
  end

  it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
    @item = FactoryBot.create(:user)
    expect(@item).to be_valid
  end
end

context '出品ができない時' do

  it '商品画像を1枚つけることが必須であること' do
    @item.image = ''
    @item.valid?
    expect(@item.errors.full_messages).to include{"Image can't be blank"}
  end

  it '商品名が必須であること' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Title can't be blank")
  end

  it '商品の説明が必須であること' do
    @item.item_info = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Detail can't be blank")
  end

  it 'カテゴリーの情報が必須であること' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category Select")
  end

  it '商品の状態についての情報が必須であること' do
    @item.item_condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition Select")
  end

  it '配送料の負担についての情報が必須であること' do
    @item.postage_payer_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping charge Select")
  end

  it '発送元の地域についての情報が必須であること' do
    @item.prefectural_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship from Select")
  end

  it '発送までの日数についての情報が必須であること' do
    @item.preparation_day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Guideline Select")
  end

  it '販売価格についての情報が必須であること' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank", "Half-width number", "Out of setting range")
  end

  it '売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
    @item.price = '100'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Out of setting range")
  end

  it '販売価格は半角数字のみ保存可能であること' do
    @price = '１００００'
    @item.valid?
    expect(@item.errors.full_messages).to receive("Half-width number")
  end
end
