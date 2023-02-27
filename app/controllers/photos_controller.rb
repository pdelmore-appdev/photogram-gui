class PhotosController < ApplicationController

  def index

@list_of_photos = Photo.order({ :created_at => :desc })


    render({ :template => "photo_templates/index.html.erb" })
  end

  def show

url_photo_id = params.fetch("path_photo_id")

@all_photos = Photo.where({ :id => url_photo_id })

@single_photo = @all_photos.first


  render({ :template => "photo_templates/show.html.erb" })
  end


end
