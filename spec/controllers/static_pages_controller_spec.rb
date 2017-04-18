require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
      expect(response.body).to include('<title>Home | Ruby on Rails Tutorial Sample App</title>')
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
      expect(response.body).to include('<title>Help | Ruby on Rails Tutorial Sample App</title>')
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
      expect(response.body).to include('<title>Contact | Ruby on Rails Tutorial Sample App</title>')
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
      expect(response.body).to include('<title>About | Ruby on Rails Tutorial Sample App</title>')
    end
  end

end
