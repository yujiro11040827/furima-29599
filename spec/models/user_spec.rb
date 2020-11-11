require 'rails_helper'
descride User do
  before do
    @user = FactoryBot.build(:user)
  end

  descride 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail,passwordとpassword_confirmation,first_nameとlast_nameとfirst_furiganaとlast_furiganaとbirth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合で６文字以上であれば登録できる" do
        @user.nickname = "a1a1a1"
        expect(@user)to.be_valid
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
     it "パスワードが５文字以下だと登録できない" do
     @user.password = 'a1a1a'
     @user.password_confirmation = 'a1a1a'
     @user.valid?
     expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters")
     end
     it "パスワードが半角英語だけだと登録できない" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be only English")
     end
     it "パスワードが数字だけだと登録できない" do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be only number")
     end
     it "passwordが存在してもpassword_confirmationが空だと登録できない" do
      @user.password = 'a1a1a1'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password_confirmation can't be blank")
     end
     it "名字が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
     end
     it "名前が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
     end
     it "名字が存在しても名前が空だと登録できない" do
      @user.last_name = '鈴木'
      @user.first_name = ''
      expect(@user.errors.full_messages).to include("First_name can't be blank")
     end
     it "名前が存在しても名字が空だと登録できない" do
      @user.first_name = '一郎'
      @user.last_name = ''
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
     end
     it "名字のフリガナが空だと登録できない" do
      @user.last_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_furigana can't be blank")
     end
     it "名前のフリガナが空だと登録できない" do
      @user.first_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_furigana can't be blank")
     end
     it "名字のフリガナが存在しても名前のフリガナが空だと登録できない" do
      @user.last_furigana = 'スズキ'
      @user.first_furigana = ''
      expect(@user.errors.full_messages).to include("First_furigana can't be blank")
     end
     it "名前のフリガナが存在しても名字のフリガナが空だと登録できない" do
      @user.first_furigana = 'イチロウ'
      @user.last_furigana = ''
      expect(@user.errors.full_messages).to include("Last_furigana can't be blank")
     end
     it "生年月日が空だと登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth_day can't be blank")
     end
    end
  end

