require "application_system_test_case"

class TipsTest < ApplicationSystemTestCase
  setup do
    @tip = tips(:one)
  end

  test "visiting the index" do
    visit tips_url
    assert_selector "h1", text: "Tips"
  end

  test "creating a Tip" do
    visit tips_url
    click_on "New Tip"

    fill_in "Paragraph", with: @tip.paragraph
    click_on "Create Tip"

    assert_text "Tip was successfully created"
    click_on "Back"
  end

  test "updating a Tip" do
    visit tips_url
    click_on "Edit", match: :first

    fill_in "Paragraph", with: @tip.paragraph
    click_on "Update Tip"

    assert_text "Tip was successfully updated"
    click_on "Back"
  end

  test "destroying a Tip" do
    visit tips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tip was successfully destroyed"
  end
end
