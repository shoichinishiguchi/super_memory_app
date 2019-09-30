require 'rails_helper'

RSpec.describe Question, type: :model do

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
