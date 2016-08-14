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
      expect(page).to have_content(/Posts/)
    end
  end
end
