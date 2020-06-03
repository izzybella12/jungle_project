require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    before do
      @user = User.new
      @user.first_name = "Isabella"
      @user.last_name = "Pana"
      @user.email = "isabella@yahoo.com"
      @user.password = "12345678"
      @user.password_confirmation = "12345678"

      @user2 = User.new
      @user2.first_name = "Isabella"
      @user2.last_name = "Grosso"
      @user2.password = "98765432"
      @user2.password_confirmation = "98765432"
    end

    it "user is properly saved in the database" do
      @user.save
      expect(@user.id).to_not be nil
    end

    it "must be created with password fields" do
      @user.password = nil
      @user.save
      expect(@user.id).to be nil
    end

    it "must be created with a password confirmation field" do
      @user.password_confirmation = nil
      @user.save
      expect(@user.id).to be nil
    end

    it "needs password and password confirmation fields to match" do
      @user.password_confirmation = "13254"
      @user.save
      expect(@user.id).to be nil
    end

    it "cannot have the same email" do
      @user.save
      @user2.email = "isabella@yahoo.com"
      @user2.save
      expect(@user2.id).to be nil
    end

    it "must have a different email that are not case sensitive" do
      @user.save
      @user2.email = "ISABELLA@YAHOO.COM"
      @user2.save
      expect(@user2.id).to_not be nil
    end

    it "is invalid if first_name isn't added" do
      @user.first_name = nil
      @user.save
      expect(@user.id).to be nil
    end

    it "is invalid if last_name isn't added" do
      @user.last_name = nil
      @user.save
      expect(@user.id).to be nil
    end

    it "is invalid if email isn't added" do
      @user.email = nil
      @user.save
      expect(@user.id).to be nil
    end

    it "has a minimum password length" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save
      expect(@user.id).to be nil
    end
  end

  describe "authenticate_with_credentials" do

    before do
      @user = User.new 
      @user.first_name = "Isabella"
      @user.last_name = "Pana"
      @user.email = "isabella@yahoo.com"
      @user.password = "12345678"
      @user.password_confirmation = "12345678"
      @user.save
    end

    it "verifies that the email and password in combo match ones in the database" do
      @foreign_user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@foreign_user).to be_instance_of(User)
      expect(@foreign_user.id).to eq(@user.id)
    end

    it "verifies that the email must match an email in the database" do
      @foreign_user = User.authenticate_with_credentials("isa@yahoo.com", @user.password)
      expect(@foreign_user).to_not be_instance_of(User)
      expect(@foreign_user).to be nil
    end

    it "verifies that the password must match the password in the database" do
      @foreign_user = User.authenticate_with_credentials(@user.email, "14234243")
      expect(@foreign_user).to_not be_instance_of(User)
      expect(@foreign_user).to be nil
    end

    it "verifies that the email is not case sensitive" do
      @foreign_user = User.authenticate_with_credentials("ISABELLA@yahoo.com", @user.password)
      expect(@foreign_user).to be_instance_of(User)
      expect(@foreign_user.id).to eq(@user.id)
    end

    it "verifies that spaces will be stripped before and after an email" do
      @foreign_user = User.authenticate_with_credentials("    isabella@yahoo.com    ", @user.password)
      expect(@foreign_user).to be_instance_of(User)
      expect(@foreign_user.id).to eq(@user.id)
    end

  end
end
