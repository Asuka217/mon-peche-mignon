require 'rails_helper'

RSpec.describe Training, type: :model do
  before do
    @training = FactoryBot.build(:training)
  end

  describe '筋トレの目標設定の投稿' do
    context '筋トレの目標設定の投稿ができる場合' do
      it 'すべての項目がきちんと入力がされている場合は保存ができる' do
        expect(@training).to be_valid
      end
    end

    context '筋トレの目標設定の投稿ができない場合' do
      it 'ユーザーがログイン状態でないと、投稿ができない' do
        
      end

      it '画像選択がされていない' do
        @training.image = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("Image can't be blank")
      end

      it '目標設定が入力されていない' do
        @training.goal = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("Goal can't be blank")
      end

      it 'ごほうびの入力がされていない' do
        @training.reward = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("Reward can't be blank")
      end

      it '開始日の日付が選択されていない' do
        @training.date_start = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("Date start can't be blank")
      end
    end
  end
end
