require 'rails_helper'

describe User do
  describe '#create' do
    # 入力されている場合のテスト ▼
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザ登録ができる時' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    # nul:false, presence: true のテスト ▼
    context 'ユーザ登録ができない時' do
      it 'nicknameがない場合は登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
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

      it 'birthdayがない場合は登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailがない場合は登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに@を含まない場合登録できないこと' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordがない場合は登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが半角英字のみの場合は登録できない    ' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = '１abcde'
        @user.password_confirmation = '１abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'a23456'
        @user.password_confirmation = 'a234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは５文字以下では登録できない事' do
        @user.password = 'a23'
        @user.password_confirmation = 'a23'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'birthdayがない場合は登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
