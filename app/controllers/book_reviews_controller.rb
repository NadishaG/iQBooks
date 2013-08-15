class BookReviewsController < ApplicationController

	def new
		@book_review = BookReview.new
		@book = Book.find(params[:book_id])
		params[:review].nil? ? @book_review_change = 'must_read' : @book_review_change = 'review'
		@book_review_change = 'rating' if params[:star_no].present?
		@book_review = @book.book_reviews.create(:member_id=>current_member.id) if params[:review].nil?
		@book_review.update_attributes(:must_read=>true) if @book_review_change == 'must_read' 
		@book_review.update_attributes(:rating=>params[:star_no]) if params[:star_no].present?
		@rating = @book.current_rating
	end

	def edit
		@book_review = BookReview.find(params[:id])
		@book = Book.find(params[:book_id])
		params[:review].nil? ? @book_review_change = 'must_read' : @book_review_change = 'review'
		@book_review_change = 'rating' if params[:star_no].present?
		@book_review.update_attributes(:must_read=>true) if @book_review_change == 'must_read' 
		@book_review.update_attributes(:rating=>params[:star_no]) if params[:star_no].present?
		@rating = @book.current_rating
	end

	def create
		@book_review = BookReview.new
		@book = Book.find(params[:book_review][:book_id])
		if BookReview.create(params[:book_review])
			redirect_to book_path(@book)
		end
	end

	def update
		@book_review = BookReview.find(params[:id])
		@book = Book.find(params[:book_review][:book_id])
		if @book_review.update_attributes(params[:book_review])
			redirect_to book_path(@book)
		end
	end

end