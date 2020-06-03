require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'Validations' do
    before :each do 
      @user = User.create(
        first_name: "John",
        last_name: "Jacobs",
        email: "johnjacob@gmail.com",
        password: "password",
      )
    end 

    it 'should create valid user' do
      expect(@user).to (be_valid)
    end 

    it 'is not valid without a first_name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end 
    it 'is not valid without a last_name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end 

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 

    it 'is valid with a case sensitive email' do
      @user.email = 'JoHnJacoB@GMAIL.coM'
      expect(@user).to be_valid
    end 


    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end 

    it 'is not valid with a password less than 5 characters' do
      @user.password = 'doom'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end 
  end

  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.create(
        first_name: "John",
        last_name: "Jacobs",
        email: "johnjacob@gmail.com",
        password: "password"
      )
    end

    it 'is not valid with not authenticated email and password' do
      authenticate = User.authenticate_with_credentials(@user.email, @user.password)
      expect(authenticate).to_not be_valid
    end 
    it "should return nil for unsaved user" do
      @user.email = "JacobJohn@gmail.com"
      authenticate = User.authenticate_with_credentials(@user.email, @user.password)
      expect(authenticate).to be_nil
    end

    it "should not return nil for an email with capitals or spacing" do 
      @user.email = "       JoHnJacob@gMail.cOm"
      authenticate = User.authenticate_with_credentials(@user.email, @user.password)
      expect(authenticate).to_not be_nil
    end 
  end


end
