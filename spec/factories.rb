FactoryGirl.define do
  factory :traveller do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    id 1

    # if needed
    # is_active true
  end
end