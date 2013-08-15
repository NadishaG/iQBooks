class IssueRecord < ActiveRecord::Base
  
  belongs_to :book
  belongs_to :member
  attr_accessible :due_date ,:book_id ,:member_id ,:returned_on
end
