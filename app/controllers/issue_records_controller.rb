class IssueRecordsController < ApplicationController
	before_filter :authenticate_member!
	
	def index
		@issue_records = IssueRecord.all
	end

	def new
		@issue_record = IssueRecord.new
	end

	def create
		@issue_record = IssueRecord.new(params[:issue_record])
		
		if @issue_record.save
			@issue_record.update_attributes(:due_date=>Time.now+2.weeks)
			@book = Book.find(params[:issue_record][:book_id])
			@book.update_attributes(:status=>'Borrowed')
			MessageMailer.send_issue_notification(@issue_record)
			redirect_to home_path
		end
	end

	def edit
		@issue_record = IssueRecord.find(params[:id])
		@issue_record.update_attributes(:returned_on=>Time.now)
		@book = @issue_record.book
		@book.update_attributes(:status=>'Available')
	end

	def destroy
		@issue_record = IssueRecord.find(params[:id])
		@issue_record.destroy
		redirect_to issue_records_path
	end

end
