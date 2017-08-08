require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create
    @user.name = "Pickle Rick"
    @user.email = "pickle_rick@example.com"
    @user.password = "1234"
    @user.password_confirmation = "1234"
    @user.save

    @baduser = User.create

    @duplicateuser = User.create
    @duplicateuser.name = "Pickle Rick Clone"
    @duplicateuser.email = "pickle_rick@example.com"
    @duplicateuser.password = "1235"
    @duplicateuser.password_confirmation = "1235"

    @capuser = User.create
    @capuser.name = "Jiggle Rick"
    @capuser.email = "JIGGLERICK@EXAMPLE.COM"
    @capuser.password = "1234"
    @capuser.password_confirmation = "1234"

    @passworduser = User.create
    @passworduser.name = "Sickle Rick"
    @passworduser.email = "sickle_rick@example.com"
    @passworduser.password = "1235"
    @passworduser.password_confirmation = "1234"

    @shortpassworduser =  User.create
    @shortpassworduser.name = "Tickle Rick"
    @shortpassworduser.email = "tickle_rick@example.com"
    @shortpassworduser.password = "123"
    @shortpassworduser.password_confirmation = "123"

    @whiteuser = User.create
    @whiteuser.name = "Fickle Rick"
    @whiteuser.email = "       fickle_rick@example.com         "
    @whiteuser.password = "1234"
    @whiteuser.password_confirmation = "1234"
  end

  describe 'Validations' do
    it "should have valid user" do
      expect(@user).to be_valid
    end

    it "should have valid name" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:name]).to include("can't be blank")
    end

    it "should have valid email" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:email]).to include("can't be blank")
    end

    it "should have valid password" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:password]).to include("can't be blank")
    end

    it "should have valid password_confirmation" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:password_confirmation]).to include("can't be blank")
    end

    it "should have a unique email" do
      expect(@user).to be_valid
      expect(@duplicateuser).to be_invalid
    end

    it "should have case-insensitive email" do
      expect(@user).to be_valid
      expect(@capuser).to be_valid
    end

    it "should have matching password and password_confirmation" do
      expect(@user).to be_valid
      expect(@passworduser).to be_invalid
    end

    it "should have password have 4 or more characters" do
      expect(@user).to be_valid
      expect(@shortpassworduser).to be_invalid
    end

  end

  describe '.authenticate_with_credentials' do

    it "should return user instance given the correct params" do
      user = User.authenticate_with_credentials("pickle_rick@example.com", "1234")
      expect(user).to eq(@user)
    end

    it "should return correct user even with whitespace in email" do
      user = User.authenticate_with_credentials(" pickle_rick@example.com ", "1234")
      expect(user).to eq(@user)
    end

    it "should return correct user even with whitespace in email" do
      user = User.authenticate_with_credentials("PICKLE_RICK@example.com", "1234")
      expect(user).to eq(@user)
    end

  end

end
