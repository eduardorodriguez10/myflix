require 'spec_helper'

describe Category do
  it   {
    category = Category.create(name:"Cat1")
    video1 = Video.create(title:"Video1", description:"Video1", category_id: category.id)
    video2 = Video.create(title:"Video1", description:"Video2", category_id: category.id)
    videos_cat1 = Video.where(category_id: category.id)
    expect(videos_cat1.count).to eq(2)
    category.destroy
    video1.destroy
    video2.destroy
  }
  describe "return recent videos" do
    it "should return only 6 most recent videos" do 
        cat = Category.create(name: "sample")
        v1 = Video.create(title:"t1", description:"t1", category: cat)
        v2 = Video.create(title:"t1", description:"t1", category: cat)
        v3 = Video.create(title:"t1", description:"t1", category: cat)
        v4 = Video.create(title:"t1", description:"t1", category: cat)
        v5 = Video.create(title:"t1", description:"t1", category: cat)
        v6 = Video.create(title:"t1", description:"t1", category: cat)
        v7 = Video.create(title:"t1", description:"t1", category: cat)
        videos = cat.recent_videos
        videos.should eq([v7,v6,v5,v4,v3,v2])

    end
    it "should return 3 most recent videos" do 
        cat = Category.create(name: "sample")
        v1 = Video.create(title:"t1", description:"t1", category: cat)
        v2 = Video.create(title:"t1", description:"t1", category: cat)
        v3 = Video.create(title:"t1", description:"t1", category: cat)
        videos = cat.recent_videos
        videos.should eq([v3,v2,v1])
    end
    it "should not return any videos" do 
         cat = Category.create(name: "sample")
        v1 = Video.create(title:"t1", description:"t1")
        v2 = Video.create(title:"t1", description:"t1")
        v3 = Video.create(title:"t1", description:"t1")
        videos = cat.recent_videos
        videos.should eq([])
    end
  end 

end