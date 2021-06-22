require 'rails_helper'

describe User do
  describe '#create' do
    # 入力されている場合のテスト ▼
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    # nul:false, presence: true のテスト ▼

    it 'nicknameがない場合は登録できないこと' do # テストしたいことの内容
      @user.nickname = '' # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入(今回の場合は意図的にnicknameの値をからに設定)
      @user.valid? # バリデーションメソッドを使用して「バリデーションにより保存ができない状態であるか」をテスト
      expect(@user.errors.full_messages).to include("Nickname can't be blank") # errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
    end

    it 'emailがない場合は登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordがない場合は登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it ' surname_kanjiがない場合は登録できないこと' do
      @user.surname_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kanji can't be blank")
    end

    it ' surname_katakanaがない場合は登録できないこと' do
      @user.surname_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname katakana can't be blank")
    end

    it ' name_kanjiがない場合は登録できないこと' do
      @user.name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji can't be blank")
    end

    it ':name_katakanaがない場合は登録できないこと' do
      @user.name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name katakana can't be blank")
    end

    it 'birthdayがない場合は登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが半角英数字混合5文字以下であれば登録できないこと' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'a23456'
      @user.password_confirmation = 'a234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'surname_kanjiが全角（漢字・ひらがな・カタカナ）入力でなければ登録できないこと' do
      @user.surname_kanji = 'ｱｲｳｴｵ' # 意図的に半角入力を行いエラーを発生させる
      @user.valid?
      expect(@user.errors.full_messages).to include('Surname kanji is invalid')
    end

    it 'name_kanjiが全角（漢字・ひらがな・カタカナ）入力でなければ登録できないこと' do
      @user.name_kanji = 'ｱｲｳｴｵ' # 意図的に半角入力を行いエラーを発生させる
      @user.valid?
      expect(@user.errors.full_messages).to include('Name kanji is invalid')
    end

    # カタカナ全角入力のテスト ▼

    it 'surname_katakanaが全角カタカナでなければ登録できないこと' do
      @user.surname_katakana = 'あいうえお' # 意図的にひらがな入力を行いエラーを発生させる
      @user.valid?
      expect(@user.errors.full_messages).to include('Surname katakana is invalid')
    end

    it 'name_katakanaが全角カタカナでなければ登録できないこと' do
      @user.name_katakana = 'あいうえお' # 意図的にひらがな入力を行いエラーを発生させる
      @user.valid?
      expect(@user.errors.full_messages).to include('Name katakana is invalid')
    end
    it 'メールアドレスに@を含まない場合登録できないこと' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  end
end
