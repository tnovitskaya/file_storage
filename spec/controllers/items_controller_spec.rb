require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  subject { FactoryGirl.create(:item) }

  describe "GET #index" do
    it "render :index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all items to subject" do
      get :index
      expect(assigns(:items)).to eq([subject])
    end
  end

  describe "GET #show" do
    it "assigns the requested item to subject" do
      get :show, id: subject
      expect(assigns(:item)).to eq(subject)
    end

    it "renders the :show view" do
      get :show, id: subject
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns the requested item to new item" do
      get :new
      expect(assigns(:item)).to be_a_new_record
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "GET #edit" do
    it "assigns the requested item as @item" do
      get :edit, id: subject
      expect(assigns(:item)).to eq(subject)
    end

    it "renders the :edit view" do
      get :edit, id: subject
      expect(response).to render_template "edit"
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new Item" do
        expect {
          post :create, item: FactoryGirl.attributes_for(:item)
        }.to change(Item, :count).by(1)
      end

      it "redirects to index path" do
        post :create, item: FactoryGirl.attributes_for(:item)
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "re-renders the 'new' template" do
        post :create, item: FactoryGirl.attributes_for(:item)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates the requested item" do
        expect{
        patch :update, id: subject, item: { title: "new item" }
        }.to change { subject.reload.title }.to('new item')
      end

      it "redirects to index path" do
        patch :update, id: subject, item: { title: "new item" }
        expect(response).to redirect_to item_path
      end
    end

    context "with invalid attributes" do
      it "re-renders the 'edit' template" do
         patch :update, id: subject, item: { title: "" }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) { @item = FactoryGirl.create :item }
    it "deletes the item" do
      expect {
        delete :destroy, id: @item
      }.to change(Item, :count).by(-1)
    end

    it "redirects to items#index" do
      delete :destroy, id: @item
      expect(response).to redirect_to root_path
    end
  end

end
