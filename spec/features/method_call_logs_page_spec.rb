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
  given(:method_call_situation_feed) do
    FactoryGirl.create(:method_call_situation,
                       class_name: "User",
                       method_symbol: "#",
                       method_name: "feed",
                       called_num: 1)
  end
  given(:method_call_situation_profile) do
    FactoryGirl.create(:method_call_situation,
                       class_name: "User",
                       method_symbol: "#",
                       method_name: "profile",
                       called_num: 0)
  end

  background do
    allow_any_instance_of(OkuribitoRails::ApplicationController).to receive(:prohibited_env?).and_return(prohibited_env)
    FactoryGirl.create(:method_call_log,
                       method_call_situation: method_call_situation_feed,
                       class_name: method_call_situation_feed.class_name,
                       method_symbol: method_call_situation_feed.method_symbol,
                       method_name: method_call_situation_feed.method_name)
    FactoryGirl.create(:method_call_log,
                       method_call_situation: method_call_situation_profile,
                       class_name: method_call_situation_profile.class_name,
                       method_symbol: method_call_situation_profile.method_symbol,
                       method_name: method_call_situation_profile.method_name)

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
  end
end
