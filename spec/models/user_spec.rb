require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = User.create(
      name:     "西行寺 幽々子",
      email:    "yuyuko@hakugyokuro.com",
      password: "password"
    )
  end
  # 名前、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, last name, email, and password" do
    expect(@user).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    user = User.new(
      name:     "魂魄 妖夢",
      email:    "yuyuko@hakugyokuro.com",
      password: "password"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
