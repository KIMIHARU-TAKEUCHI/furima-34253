require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

  context '保存できる場合' do
    
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00000'
      expect(@user).to be_valid
    end
  end

    context '保存できない場合' do

     it "nicknameが空だと登録できない" do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "family_nameが空だと登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "first_nameは漢字・平仮名・カタカナ以外では登録できない" do
      @user.first_name = '1aA'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "falimy_nameは漢字・平仮名・カタカナ以外では登録できない" do
      @user.family_name = '1aA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end

    it "first_name_kanaは全角カタカナ以外では登録できない" do
      @user.first_name_kana = '1aｶあ/'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
    end

    it "family_name_kanaは全角カタカナ以外では登録できない" do
      @user.family_name_kana = '1aｶあ/'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana 全角文字を使用してください")
    end

     it "emailが空では登録できない" do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it 'emailに@が含まれていない場合登録できない' do
      @user.email = 'aaaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

      it 'passwordが5文字以下では登録できない' do
       @user.password = 'a0000'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end

     it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'Aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end

     it 'password:全角英数混合では登録できないこと' do
      @user.password = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end

     it 'password:半角数字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end

     it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '890iop'
      @user.password_confirmation = '123qwe'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

     it '生年月日が空では登録できない' do
       @user.birth_data = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birth data can't be blank")
      end
    end
   end
 end