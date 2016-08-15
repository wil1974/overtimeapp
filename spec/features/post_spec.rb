require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content("Posts")
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com", password: "password",
               password_confirmation: "password", first_name: "John", last_name: "Snow")
      # the helper Warden that was specified in rails_helper.rb
      login_as(user, :scope => :user)
      visit new_post_path
    end

    it 'has a NEW form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale text"
      click_on "Save"
      expect(page).to have_content("Some rationale text")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

end
