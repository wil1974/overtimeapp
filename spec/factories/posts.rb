FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some Rationale text"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Different Rationale text"
    user
  end
end
