FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some Rationale text"
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Different Rationale text"
  end
end
