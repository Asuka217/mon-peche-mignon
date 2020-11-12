require 'rails_helper'

RSpec.describe Achievement, type: :model do
  before do
    @achievement = FactoryBot.build(:achievement)
  end

  describe '達成報告の投稿' do

    context '達成報告の投稿ができる場合' do
      it '必要な項目がきちんと入力がされている場合は保存ができる' do
        expect(@achievement).to be_valid
      end

      it 'imageが空でも保存はできる' do
        @achievement.image = nil
        expect(@achievement).to be_valid
      end

      it 'reportが空でも保存はできる' do
        @achievement.report = nil
        expect(@achievement).to be_valid
      end
    end

    context '達成報告の投稿ができない場合' do

      it '終了日が入力されていない' do
        @achievement.date_end = nil
        @achievement.valid?
        expect(@achievement.errors.full_messages).to include("終了日を入力してください")
      end
    end
  end
end
