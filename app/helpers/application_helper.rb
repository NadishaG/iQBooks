module ApplicationHelper

	def grouped_options_for_books
		{
			'Available in Library' => Book.where(:status=>'Available').map {|book| [book.title, book.id]}
		}		
	end 

	def grouped_options_for_members
		{
			'Quovantis' => Member.all.map {|member| [member.name, member.id]},
		}		
	end 

	def default_image(_image_for,_issued,_image_class)
		if _image_class=='book'
			if _issued
				_image_for.try(:image_url).present? ? image_tag(_image_for.image_url, :class=>'issued_book') : image_tag("default_book_cover.jpg" ,:class=>'issued_book') rescue nil
			else
				_image_for.try(:image_url).present? ? image_tag(_image_for.image_url) : image_tag("default_book_cover.jpg") rescue nil	
			end
		elsif _image_class=='member'
			_image_for.try(:image_url).present? ? image_tag(_image_for.image_url, :class=>"img-circle") : image_tag("edit-profile.png" , :class=>"img-circle") rescue nil
		elsif _image_class=='related_books'
			_image_for.try(:image_url).present? ? image_tag(_image_for.image_url, :class=>'image_highlight') : image_tag("default_book_cover.jpg" ,:class=>'image_highlight') rescue nil
		end
	end

	def return_active(controller_name="")
		if controller_name
			if controller_name=='books' && params[:action]=='show'
				''
			elsif controller_name=='members' && params[:action]=='show' && params[:id]!=current_member
				''
			else
				controller_name == params[:controller] ? 'active' : ''
			end
		end
	end

	def like_path(_review,_like,_book)
		if _review && _like
			link_to "", "", :class=> 'like'
		elsif _review && _like.nil?
			link_to "", edit_book_review_path(_review,:book_id=>_book.id),:class=> 'unlike',:remote=>true 
		else  
			link_to "", new_book_review_path(:book_id=>_book.id),:class=> 'unlike',:remote=>true
		end
	end

end		