require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail,passwordとpassword_confirmation,first_nameとlast_nameとfirst_furiganaとlast_furiganaとbirth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailに＠がないと登録できない" do
      @user.email = 'hogehegecom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
     it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "パスワードが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "パスワードが英語のみだと登録できない" do
     @user.password = 'aaaaaa'
     @user.password_confirmation = 'aaaaaa'
     @user.valid?
     expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "パスワードが数字のみだと登録できない" do
      @user.password = '111111'
     @user.password_confirmation = '111111'
     @user.valid?
     expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "passwordが存在してもpassword_confirmationが空だと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "名字が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it "名字が全角でないと登録できない" do
      @user.last_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it "名前が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
     end
     it "名前が全角でないと登録できない" do
      @user.last_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it "名字のフリガナが空だと登録できない" do
      @user.last_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furigana can't be blank", "Last furigana is invalid")
     end
     it "名字のフリガナが全角カナでないと登録できない" do
      @user.last_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it "名前のフリガナが空だと登録できない" do
      @user.first_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First furigana can't be blank", "First furigana is invalid")
     end
     it "名前のフリガナが全角カナでないと登録できない" do
      @user.last_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it "生年月日が空だと登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
     end
    end
  end
end
