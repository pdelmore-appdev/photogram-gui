class PhotosController < ApplicationController

  def index

@list_of_photos = Photo.order({ :created_at => :desc })


    render({ :template => "photo_templates/index.html.erb" })
  end


end
