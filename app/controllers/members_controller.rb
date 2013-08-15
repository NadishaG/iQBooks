class MembersController < ApplicationController
	before_filter :authenticate_member!

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if @member.update_attributes(params[:member])
			redirect_to member_path(@member)
		end
	end

	def show
		@member = Member.find(params[:id])
		@liked_books = @member.must_reads
	end

end
