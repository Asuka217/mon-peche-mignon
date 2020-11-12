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

      it '画像選択がされていない' do
        @training.image = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("画像を入力してください")
      end

      it '目標設定が入力されていない' do
        @training.goal = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("目標を入力してください")
      end

      it 'ごほうびの入力がされていない' do
        @training.reward = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("ごほうびを入力してください")
      end

      it '開始日の日付が選択されていない' do
        @training.date_start = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("開始日を入力してください")
      end

      it '終了予定日が入力されていない' do
        @training.expected_date = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("終了予定日を入力してください")
      end
    end
  end
end
