FactoryBot.define do
  factory :buy_destination do
    user_id             {3}
    product_id          {4}
    buy_id              {5}
    postal_code         {'761-0113'}
    shipment_source_id  {3}
    city                {"横浜市青葉区"}
    address             {"青山1-1"}
    building            {"柳ビル２階"}
    phone_number        {"09012345678"}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
