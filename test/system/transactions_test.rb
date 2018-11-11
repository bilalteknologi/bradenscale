require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @transaction = transactions(:one)
  end

  test "visiting the index" do
    visit transactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "creating a Transaction" do
    visit transactions_url
    click_on "New Transaction"

    fill_in "Age", with: @transaction.age
    fill_in "Bed Number", with: @transaction.bed_number
    fill_in "Checkin Date", with: @transaction.checkin_date
    fill_in "Doctor", with: @transaction.doctor
    fill_in "Gender", with: @transaction.gender
    fill_in "Integer", with: @transaction.integer
    fill_in "Medic Record Number", with: @transaction.medic_record_number
    fill_in "Name", with: @transaction.name
    fill_in "Ruangan", with: @transaction.ruangan
    click_on "Create Transaction"

    assert_text "Transaction was successfully created"
    click_on "Back"
  end

  test "updating a Transaction" do
    visit transactions_url
    click_on "Edit", match: :first

    fill_in "Age", with: @transaction.age
    fill_in "Bed Number", with: @transaction.bed_number
    fill_in "Checkin Date", with: @transaction.checkin_date
    fill_in "Doctor", with: @transaction.doctor
    fill_in "Gender", with: @transaction.gender
    fill_in "Integer", with: @transaction.integer
    fill_in "Medic Record Number", with: @transaction.medic_record_number
    fill_in "Name", with: @transaction.name
    fill_in "Ruangan", with: @transaction.ruangan
    click_on "Update Transaction"

    assert_text "Transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction" do
    visit transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction was successfully destroyed"
  end
end
