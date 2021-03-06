class SearchController < ApplicationController
  layout 'application'
  before_filter :login_required, :only => :destroy
  before_filter :not_logged_in_required, :only => [:new, :create]

  def tag_cloud 
	  @tags = Word.tag_counts(:limit => 20, :order => 'id desc') # returns all the tags used 
  end
      
  def search
	  @words = Word.search params[:search], :per_page => 20, :page => params[:page]
	  respond_to do |format|
	    format.html{}
	    format.rss {}
	  end
  end
end
