FactoryBot.define do
  factory :product do
    name                {"服"}
    genre_id            {3}
    price               {500}
    status_id           {2}
    shipment_source_id  {3}
    date_shipment_id    {3}
    shipment_charge_id  {1}
    explanation         {"夏用の白いシャツ"}
  end
end
