require 'spec_helper'

describe Video do
  it { should belong_to(:category)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}

  describe "search?" do
    it "should return one object" do
      v1 = Video.create(title: "Space Train", description:"The space fast train")
      v2 = Video.create(title: "Dog Train", description:"The dog train")
      videos = Video.search_by_title("Space")
      videos.should eq([v1])
    end

    it "should return an array of objects" do
      v1 = Video.create(title: "Space Train", description:"The space fast train")
      v2 = Video.create(title: "Dog Train", description:"The dog train")
      videos = Video.search_by_title("train")
      videos.should eq([v1, v2])
    end

    it "should return an empty array" do
      v1 = Video.create(title: "Space Train", description:"The space fast train")
      v2 = Video.create(title: "Dog Train", description:"The dog train")
      videos = Video.search_by_title("captain")
      videos.should eq([])
    end
  end

end

