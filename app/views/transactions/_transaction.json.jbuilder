json.extract! transaction, :id, :name, :age, :checkin_date, :gender, :ruangan, :doctor, :medic_record_number, :bed_number, :integer, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
