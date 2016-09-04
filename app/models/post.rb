class Post < ActiveRecord::Base
  # enum method allows triggering of state in database
  # so you could use p.approved!, p.submitted? etc
  enum status: {submitted: 0, approved: 1, rejected: 2}
  belongs_to :user
  validates_presence_of :date, :rationale
end
