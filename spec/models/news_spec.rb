require 'rails_helper'

RSpec.describe News, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        news = News.new(content: "this is content", author_id: 1)

        expect(news).to be_invalid
      end
      it "is invalid without content" do
        news = News.new(title: "News Title", author_id: 1)

        expect(news).to be_invalid
      end
      it "is invalid without an author" do
        news = News.new(title: "News Title", content: "news content")

        expect(news).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.create(first_name: "Erin", last_name: "Pintozzi", email: "erin@email.com", password: "password")
        news = News.new(title: "News Title", content: "news content", author_id: user.id, image: "image.jpg")

        expect(news).to be_valid
      end
    end
  end
  describe "relationships" do
    it "belongs to author" do
      news = create(:news)
      expect(news).to respond_to(:author)
    end
  end
end
