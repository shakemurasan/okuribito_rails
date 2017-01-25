RSpec.feature "method_call_log pages", type: :feature do
  def expect_search_area
    within(".search-area") do
      expect(page).to have_content "Class name"
      expect(page).to have_content "Method name"
    end
  end

  def expect_method_call_info
    within(".method_call_info") do
      expect(page).to have_content "Method name"
      expect(page).to have_content "Backtrace"
      expect(page).to have_content "Recording date"
    end
  end

  given(:prohibited_env) { false }

  background do
    allow_any_instance_of(OkuribitoRails::ApplicationController).to receive(:prohibited_env?).and_return(prohibited_env)
    FactoryGirl.create(:method_call_situation, :user_feed, :with_method_call_log, called_num: 1)
    FactoryGirl.create(:method_call_situation, :user_profile, :with_method_call_log, called_num: 0)

    visit method_call_logs_path
  end

  context "Prohibit WebUI" do
    given(:prohibited_env) { true }

    scenario "Forbidden(403)" do
      expect(current_path).to eq method_call_logs_path
      expect(page).to have_http_status(403)
    end
  end

  context "Permit WebUI" do
    scenario "Succsess page render" do
      expect(current_path).to eq method_call_logs_path
      expect(page).to have_http_status(200)
      expect_search_area
      expect_method_call_info
      expect(page).to have_selector("table.method_call_info tbody tr", count: 3)
    end

    scenario "Available search function" do
      expect(current_path).to eq method_call_logs_path
      expect(page).to have_http_status(200)

      within(".search-area") do
        fill_in "class_name", with: "User"
        fill_in "method_name", with: "profile"
        click_button "Search"
      end

      expect_search_area
      expect_method_call_info
      expect(page).to have_selector("table.method_call_info tbody tr", count: 2)
    end

    scenario "Available search function(like search)" do
      expect(current_path).to eq method_call_logs_path
      expect(page).to have_http_status(200)

      within(".search-area") do
        fill_in "method_name", with: "file"
        click_button "Search"
      end

      expect_search_area
      expect_method_call_info
      expect(page).to have_selector("table.method_call_info tbody tr", count: 2)
    end
  end
end
