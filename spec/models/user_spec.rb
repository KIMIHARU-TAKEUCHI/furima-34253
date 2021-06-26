require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

     it "nicknameが空だと登録できない" do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it "emailが空では登録できない" do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00000'
      expect(@user).to be_valid
    end

      it 'passwordが5文字以下では登録できない' do
       @user.password = '00000'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end

     it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'Aaaaaaa'
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