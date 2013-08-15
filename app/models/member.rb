class Member < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :role ,:image , :forem_admin ,:tagline ,:joining_date, :project
  
  mount_uploader :image, ImageUploader 
  
  has_many :books ,:class_name =>'Book'
  has_many :book_reviews 
  has_many :issue_records 
  has_many :issued_books ,:class_name=>'Book',:through=> :issue_records , :source =>:book

  has_many :must_reads, :through => :book_reviews, :source=> :book, :conditions => {"book_reviews.must_read" => true} 

  def is_admin
  	forem_admin
  end

  def member_book_reviews
    book_reviews.where('review is not null')
  end
end
