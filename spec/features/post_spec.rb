require 'rails_helper'

describe 'navigate' do
  before do
    #Why build_stubbed cant be used 'coz this have to hit Database
    #to query for the relationship under the test case 'will have a user associated with it'
    #the query => expect(User.last.posts.last.rationale).to eq("User Association")
    @user = FactoryGirl.create(:user)
    # the helper Warden that was specified in rails_helper.rb
    login_as(@user, :scope => :user)
  end

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

    it 'has a list of posts' do
      # We can use FactoryGirl.create but it will hit the database and slow things down
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      # Use FactoryGirl method to speed things up.. it mimicks a database query
      # But I tried and can't get it working
      # post1 = FactoryGirl.build_stubbed(:post)
      # post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Some|Different/)
    end
  end

  describe 'creation' do
    before do
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

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited'  do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"
      expect(page).to have_content("Edited content")
    end
  end

end
