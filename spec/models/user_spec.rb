require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
       user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", birth_data: "19010101")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
       user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000", birth_data: "19010101")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空では登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", birth_data: "1901-01-01")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
      it 'passwordが5文字以下では登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000", password_confirmation: "00000", birth_data: "1901-01-01")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it '生年月日が空では登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", birth_data: "")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
    end
     it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",birth_data: "19010101")
      expect(@user).to be_valid
     end
     it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'Aaaaaaa'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
   end
 end