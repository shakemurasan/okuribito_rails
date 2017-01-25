RSpec.feature "method_call_situation pages", type: :feature do
  def expect_search_area
    within(".search-area") do
      expect(page).to have_content "Class name"
      expect(page).to have_content "Method name"
      expect(page).to have_content "x days passed"
      expect(page).to have_content "Uncalled"
      expect(page).to have_content "Called"
    end
  end

  def expect_method_call_info
    within(".method_call_info") do
      expect(page).to have_content "Method name"
      expect(page).to have_content "Times of called"
      expect(page).to have_content "Days monitored"
      expect(page).to have_content "Monitoring start date"
    end
  end

  given(:prohibited_env) { false }

  background do
    allow_any_instance_of(OkuribitoRails::ApplicationController).to receive(:prohibited_env?).and_return(prohibited_env)
    FactoryGirl.create(:method_call_situation, :user_feed, called_num: 1)
    FactoryGirl.create(:method_call_situation, :user_profile, called_num: 0)
    visit method_call_situations_path
  end

  context "Prohibit WebUI" do
    given(:prohibited_env) { true }

    scenario "Forbidden(403)" do
      expect(current_path).to eq method_call_situations_path
      expect(page).to have_http_status(403)
    end
  end

  context "Permit WebUI" do
    scenario "Succsess page render" do
      expect(current_path).to eq method_call_situations_path
      expect(page).to have_http_status(200)
      expect_search_area
      expect_method_call_info
      expect(page).to have_selector("table.method_call_info tbody tr", count: 3)
    end

    scenario "Available search function" do
      expect(current_path).to eq method_call_situations_path
      expect(page).to have_http_status(200)

      within(".search-area") do
        fill_in "class_name", with: "User"
        fill_in "method_name", with: "profile"
        fill_in "x_days_passed", with: 0
        check "uncalled_method"
        click_button "Search"
      end

      expect_search_area
      expect_method_call_info
      expect(page).to have_selector("table.method_call_info tbody tr", count: 2)
    end

    scenario "Available search function(like search)" do
      expect(current_path).to eq method_call_situations_path
      expect(page).to have_http_status(200)

      within(".search-area") do
        fill_in "method_name", with: "file"
        click_button "Search"
      end

      expect_search_area
      expect_method_call_info
      expect(page).to have_selector("table.method_call_info tbody tr", count: 2)
    end

    scenario "Available search function(called method)" do
      expect(current_path).to eq method_call_situations_path
      expect(page).to have_http_status(200)

      within(".search-area") do
        check "called_method"
        click_button "Search"
      end

      expect_search_area
      expect_method_call_info
      expect(page).to have_selector("table.method_call_info tbody tr", count: 2)
    end
  end
end
