class HomeController < ApplicationController
	before_filter :authenticate_member!
	
	def index
	end

	def demo
		@books = Book.all if params[:option]=='all'
		@books = Book.where(:status =>'Available') if params[:option]=='available'
		@books = Book.where(:status =>'Borrowed') if params[:option]=='issued'
		@books = Book.all if params[:option]=='categories'
		@books = Book.where(:status => 'Recommended') if params[:option]=='recommended'
		@books = Book.where(:status => 'On-Demand') if params[:option]=='on-demand'
		@books = Book.where(:category => 'Programming') if params[:category]=='Programming'
		@books = Book.where(:category => 'Software Requirement and Analysis') if params[:category]=='Analysis'
		@books = Book.where(:category => 'Interface Design') if params[:category]=='Design'
		@books = Book.where(:category => 'Management') if params[:category]=='Management'
		@books = Book.where(:category => 'General') if params[:category]=='General' 
	end
end
