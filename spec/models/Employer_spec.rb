require "spec_helper"

describe "Employer" do

  before { @employer = User.new(name: "Example User",email: "user@example.com",password: "test_password") }


  subject { @employer }
  it { should be_valid }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }

  describe "when name is not present" do
    before { @employer.name = "" }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @employer.email = "" }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @employer.password = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @employer.name = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @employer.email = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when password is too long" do
    before { @employer.password = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @employer.email = invalid_address
        @employer.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @employer.email = valid_address
        @employer.should be_valid
      end
    end
  end

  describe "Should find user through email" do
    before { @employer.save }
    let(:found_user) { Employer.find_by_email(@employer.email) }
    it { should =  :found_user}
  end

  describe "with find the employee by password" do
    before { @employer.save }
    let(:found_user) { Employer.find_by_password(@employer.password) }
    it { should = :found_user }
  end

  describe " email and password should match" do
    before { @employer.save }
    let(:found_user1) { Employer.find_by_email(@employer.email) }
    let(:found_user2) { Employer.find_by_password(@employer.password) }
    it { should = (:found_user1 == :found_user2 ) }
  end

end