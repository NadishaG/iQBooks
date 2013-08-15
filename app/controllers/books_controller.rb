class BooksController < ApplicationController
	before_filter :authenticate_member!

	def index
		@books_programming = Book.where(:category => 'Programming').includes(&:issue_record)
		@books_software_analysis = Book.where(:category => 'Software Requirement and Analysis').includes(&:issue_record)
		@books_interface_design = Book.where(:category => 'Interface Design').includes(&:issue_record) 
		@books_management = Book.where(:category => 'Management').includes(&:issue_record) 
		@books_general = Book.where(:category => 'General').includes(&:issue_record)
		@i = 0 ;
		@section1 = @books_programming.count%8 == 0 ? @books_programming.count/8 -1 : @books_programming.count/8;
		@section2 = @books_software_analysis.count%8 == 0 ? @books_software_analysis.count/8 - 1: @books_software_analysis.count/8 ;
		@section3 = @books_interface_design.count%8 == 0 ? @books_interface_design.count/8 -1 : @books_interface_design.count/8 ;
		@section4 = @books_management.count%8 == 0 ? @books_management.count/8 -1 : @books_management.count/8 ;
		@section5 = @books_general.count%8 == 0 ? @books_general.count/8 -1 : @books_general.count/8 ;
	end

	def update
		@book = Book.find(params[:id])
	end

	def new
		@book =Book.new
		params[:demand] ? @demand = true : @demand = false
	end

	def create
		@book= Book.new(params[:book])
		if @book.save
			MessageMailer.send_ondemand_book_notification(@book) if params[:book][:status] == 'On-Demand'
			redirect_to member_path(current_member)
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update_attributes(params[:book])
		redirect_to root_path
	end

	def show
		@book = Book.find_by_title(params[:id])
		@book_review = @book.book_reviews.where(:member_id=>current_member.id).first
		@like = @book.book_reviews.where(:member_id=>current_member.id,:must_read=>true).first
		@other_books = (Book.where(:author=>@book.author) - [@book])
		@issuer = @book.issue_records.includes(&:member)
		@rating = @book.current_rating
		respond_to do |format|
			format.js
			format.html
		end
	end

	def rating
		@book = Book.find(params[:book_id])
		@rating = @book.current_rating
	end

end
