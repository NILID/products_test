require 'cancan/matchers'

module ControllerMacros

  # default user role for empty params
  # see all traits in user factory

  def login_user(user=:default)
    before(:each) do
      @user = (user == :default) ? create(:user) : create(:user, user)

      sign_in(@user)
      @ability = Ability.new(@user)
    end
  end
end