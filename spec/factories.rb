FactoryGirl.define do
  factory :user do
    name     "Madhok"
    email    "madhok@example.com"
    password "madhok"
    skills "C,C++"
    experience 5
  end

  factory :employer do
    company     "CMU"
    email    "admin@cmu.com"
    password "CMU"
  end
end
