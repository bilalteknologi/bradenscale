require "application_system_test_case"

class DecisionsTest < ApplicationSystemTestCase
  setup do
    @decision = decisions(:one)
  end

  test "visiting the index" do
    visit decisions_url
    assert_selector "h1", text: "Decisions"
  end

  test "creating a Decision" do
    visit decisions_url
    click_on "New Decision"

    fill_in "Begin Value", with: @decision.begin_value
    fill_in "Decision", with: @decision.decision
    fill_in "End Value", with: @decision.end_value
    click_on "Create Decision"

    assert_text "Decision was successfully created"
    click_on "Back"
  end

  test "updating a Decision" do
    visit decisions_url
    click_on "Edit", match: :first

    fill_in "Begin Value", with: @decision.begin_value
    fill_in "Decision", with: @decision.decision
    fill_in "End Value", with: @decision.end_value
    click_on "Update Decision"

    assert_text "Decision was successfully updated"
    click_on "Back"
  end

  test "destroying a Decision" do
    visit decisions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Decision was successfully destroyed"
  end
end
