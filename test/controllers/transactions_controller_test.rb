require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { age: @transaction.age, bed_number: @transaction.bed_number, checkin_date: @transaction.checkin_date, doctor: @transaction.doctor, gender: @transaction.gender, integer: @transaction.integer, medic_record_number: @transaction.medic_record_number, name: @transaction.name, ruangan: @transaction.ruangan } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { age: @transaction.age, bed_number: @transaction.bed_number, checkin_date: @transaction.checkin_date, doctor: @transaction.doctor, gender: @transaction.gender, integer: @transaction.integer, medic_record_number: @transaction.medic_record_number, name: @transaction.name, ruangan: @transaction.ruangan } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
