class Book < ActiveRecord::Base

	has_many :issue_records 	
	has_many :book_reviews 
	belongs_to :member 

	has_many :must_reads, :through => :book_reviews, :source=> :member, :conditions => {"book_reviews.must_read" => true} 
	has_many :ratings, :through => :book_reviews, :source=> :member, :conditions => "book_reviews.rating IS NOT NULL" 
	has_many :reviews, :through => :book_reviews, :source=> :member, :conditions => "book_reviews.review IS NOT NULL" 
	
	attr_accessible :author, :copy, :description, :status, :title ,:category ,:member_id, :image
	
	mount_uploader :image, ImageUploader

	def to_param
		title
	end	

	def book_review_record(member="")
		book_reviews.where(:member_id=>member).present? ? book_reviews.where(:member_id=>member).first.id : false
	end

	def current_book_reviews
		book_reviews.where('review is not null')
	end

	def current_rating
		_i=0
		_total_rating=0
		book_ratings = BookReview.all_ratings(self)
		book_ratings.each do |_rating|
			_total_rating+= _rating.rating
			_i+=1	
		end
		_i==0 ? 0 : _total_rating/_i 
	end

end
