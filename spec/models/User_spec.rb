require "spec_helper"

describe "User" do

  before { @user = User.new(name: "Example User",email: "user@example.com",password: "test_password",skills: "test skills",experience: 4) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:experience) }

  describe "when name is not present" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @user.email = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when password is too long" do
    before { @user.password = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
    end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "Should find user through email" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }
     it { should = :found_user }
  end

 describe "with find the user by password" do
   before { @user.save }
   let(:found_user) { User.find_by_password(@user.password) }
   it { should = :found_user }
  end

  describe " email and password should match" do
    before { @user.save }
    let(:found_user1) { User.find_by_email(@user.email) }
    let(:found_user2) { User.find_by_password(@user.password) }
    it { should = (:found_user1 == :found_user2 ) }
  end

  end

