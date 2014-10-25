require 'spec_helper'
require 'services/dog_photo_importer'

describe DogPhotoImporter do
  it "stores the given photo using the given uploader" do
    uploader = spy(:uploader)
    photo = double(:photo)
    importer = DogPhotoImporter.new(uploader: uploader)

    importer.import(photo)

    expect(uploader).to have_received(:store!).with(photo)
  end

  it "returns a DogPhoto for each uploaded version" do
    uploader = double(:uploader).as_null_object
    photo = double(:photo)

    allow(uploader).to receive(:versions).and_return({
      "a" => double(path: "/a.jpg"),
      "b" => double(path: "/b.jpg"),
    })

    importer = DogPhotoImporter.new(uploader: uploader)

    photos = importer.import(photo)

    expect(photos).to eq([
      DogPhoto.new(path: "/a.jpg", version_name: "a"),
      DogPhoto.new(path: "/b.jpg", version_name: "b"),
    ])
  end
end
