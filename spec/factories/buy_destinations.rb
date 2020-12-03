FactoryBot.define do
  factory :buy_destination do
    user_id             {3}
    products_id         {4}
    buys_id             {5}
    postal_code         {'761-0113'}
    shipment_source_id  {3}
    city                {"横浜市青葉区"}
    address             {"青山1-1"}
    phone_number        {"09012345678"}
  end
end
