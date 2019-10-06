require 'rails_helper'

RSpec.describe User, type: :model do
  describe "名前のバリデーション" do

    it "名前が12文字の時はvalid" do
      user = FactoryBot.build(:user, name: "a"*12)
      expect(user).to be_valid
    end

    it "名前が13文字の時はエラー" do
      user = FactoryBot.build(:user, name: "a"*13)
      user.valid?
      expect(user.errors[:name]).to include("名前は12文字以内でお願いします")
    end

    it "名前が無い時はエラー" do
      user = FactoryBot.build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("名前は必須です")
    end

  end

  describe "メールアドレスのバリデーション" do
    it "メールアドレスがおかしな形式の時はエラー" do
      user = FactoryBot.build(:user, email: "fal@kjfah.d")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスが間違えているか、既に登録されています")
    end

    it "メールアドレスが空の時はエラー" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスは必須です")
    end
     let!(:user){ FactoryBot.create(:user, email: "sample@example.com")}

    it "メールアドレスがかぶるのはエラー" do
      second_user = FactoryBot.build(:user, email: "sample@example.com")
      second_user.valid?
      expect(second_user.errors[:email]).to include("メールアドレスが間違えているか、既に登録されています")
    end

    it "メールアドレスが大文字混ざっていてもかぶるのはエラー" do
      second_user = FactoryBot.build(:user, email: "saMpLE@eXamPle.CoM")
      second_user.save
      second_user.valid?
      expect(second_user.errors[:email]).to include("メールアドレスが間違えているか、既に登録されています")
    end

  end

  describe "パスワードのバリデーション" do

    it "パスワードが5文字の時はエラー" do
      user = FactoryBot.build(:user, password: "12345")
      user.valid?
      expect(user.errors[:password]).to include("パスワードは6文字以上でお願いします")
    end

    it "パスワードが6文字の時はエラー出ない" do
      user = FactoryBot.build(:user, password: "123456")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードが確認と一致しない時はエラー" do
      user = FactoryBot.build(:user, password: "123456", password_confirmation: "654321")
      user.valid?
      expect(user).not_to be_valid
    end
  end
end
