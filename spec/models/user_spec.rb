require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空の場合は登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できないこと' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でないと登録できないこと' do
        @user.password = 'aa111'
        @user.password_confirmation = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに英字と数字の両方が含まれてないと登録できないこと' do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できないとこ' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在した場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが英字では登録できないこと' do
        @user.last_name = 'higashi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが英字では登録できないこと' do
        @user.first_name = 'yuichirou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'kana_last_nameが空では登録できないこと' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_last_nameがカタカナ以外だと登録できないこと' do
        @user.kana_last_name = 'higashi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name Full-width characters')
      end
      it 'kana_first_nameが空では登録できないこと' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_first_nameがカタカナ以外だと登録できないこと' do
        @user.kana_first_name = 'yuichorou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name Full-width characters')
      end
      it 'birth_dateが空では登録できないこと' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
