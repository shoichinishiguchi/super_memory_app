require 'rails_helper'

RSpec.describe Question, type: :model do

  describe "バリデーション" do
    it "is valid with 50 chars title" do
      question = FactoryBot.build(:question, title: "a"*50)
      expect(question).to be_valid
    end

    it "is invalid with 51 chars title" do
      question = FactoryBot.build(:question, title: "a"*51)
      question.valid?
      expect(question.errors[:title]).to include("は50文字以内で入力してください")
    end


    it "is invalid without title" do
      question = FactoryBot.build(:question, title: "")
      question.valid?
      expect(question.errors[:title]).to include("を入力してください")
    end

    it "is valid with 500 chars question" do
      question = FactoryBot.build(:question, question: "a"*500)
      expect(question).to be_valid
    end

    it "is invalid with 501 chars question" do
      question = FactoryBot.build(:question, question: "a"*501)
      question.valid?
      expect(question.errors[:question]).to include("は500文字以内で入力してください")
    end

    it "is invalid without question" do
      question = FactoryBot.build(:question, question: "")
      question.valid?
      expect(question.errors[:question]).to include("を入力してください")
    end


    it "is valid with 500 chars answer" do
      question = FactoryBot.build(:question, answer: "a"*500)
      expect(question).to be_valid
    end

    it "is invalid with 501 chars answer" do
      question = FactoryBot.build(:question, answer: "a"*501)
      question.valid?
      expect(question.errors[:answer]).to include("は500文字以内で入力してください")
    end

    it "is invalid without " do
      question = FactoryBot.build(:question, answer: "")
      question.valid?
      expect(question.errors[:answer]).to include("を入力してください")
    end
  end

  describe "スコープ" do

  end


  describe "メソッド" do
    it "#created_time" do
      question = FactoryBot.build(:question, created_at: "2019-10-01 13:11:27")
      expect(question.created_time).to eq  "2019/10/1 22:11:27"
    end

    describe "#created_timeメソッド" do
      it "未回答" do
        question = FactoryBot.build(:question)
        expect(question.ans_count).to eq  "未回答"
      end
      it "10回中7回正解" do
        question = FactoryBot.build(:question, correct_cnt: 7, wrong_cnt: 3)
        expect(question.ans_count).to eq  "7 / 10"
      end
    end


  end

end
