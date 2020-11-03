require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録ができる場合' do
      it 'すべての項目が入力されている' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空欄だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空欄だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@は必須' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'emailが重複していると登録できない' do
        @user.save
        user1 = FactoryBot.build(:user)
        user1.email = @user.email
        user1.valid?
        expect(user1.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空欄だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは5文字以下' do
        @user.password = 'kuma1'
        @user.password_confirmation = 'kuma1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみだと、登録できない' do
        @user.password = 'kumakuma'
        @user.password_confirmation = 'kumakuma'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'Passwordが半角数字のみだと、登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.invalid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordはpassword_confirmationのどちらも入力されていないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '性別が選択されていない' do
        @user.sex_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Sex must be other than 1')
      end

      it '年齢が選択されていない' do
        @user.age_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Age must be other than 1')
      end

      it '体型がされていない' do
        @user.figure_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Figure must be other than 1')
      end
    end
  end
end
