require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) do { name: "Sample Category" } end
  let(:invalid_attributes) do { name: nil } end

  describe "GET #index" do
    it "assigns all categories to @categories" do
      category = create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested category to @category" do
      category = create(:category)
      get :show, params: { id: category.to_param }
      expect(assigns(:category)).to eq(category)
    end

    it "renders the show template" do
      category = create(:category)
      get :show, params: { id: category.to_param }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new category as @category" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "assigns the requested category as @category" do
      category = create(:category)
      get :edit, params: { id: category.to_param }
      expect(assigns(:category)).to eq(category)
    end

    it "renders the edit template" do
      category = create(:category)
      get :edit, params: { id: category.to_param }
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new category" do
        expect {
          post :create, params: { category: valid_attributes }
        }.to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, params: { category: valid_attributes }
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
      end

      it "redirects to the created category" do
        post :create, params: { category: valid_attributes }
        expect(response).to redirect_to(Category.last)
      end
    end

    context "with invalid parameters" do
      it "assigns a newly created but unsaved category as @category" do
        post :create, params: { category: invalid_attributes }
        expect(assigns(:category)).to be_a_new(Category)
      end

      it "re-renders the new template" do
        post :create, params: { category: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) do
      {
        name: "Updated Category Name",
      }
    end

    context "with valid parameters" do
      it "updates the requested category" do
        category = create(:category)
        put :update, params: { id: category.to_param, category: new_attributes }
        category.reload
        expect(category.name).to eq(new_attributes[:name])
      end

      it "assigns the requested category as @category" do
        category = create(:category)
        put :update, params: { id: category.to_param, category: new_attributes }
        expect(assigns(:category)).to eq(category)
      end

      it "redirects to the category" do
        category = create(:category)
        put :update, params: { id: category.to_param, category: new_attributes }
        expect(response).to redirect_to(category)
      end
    end

    context "with invalid parameters" do
      it "assigns the category as @category" do
        category = create(:category)
        put :update, params: { id: category.to_param, category: invalid_attributes }
        expect(assigns(:category)).to eq(category)
      end

      it "re-renders the edit template" do
        category = create(:category)
        put :update, params: { id: category.to_param, category: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category = create(:category)
      expect {
        delete :destroy, params: { id: category.to_param }
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = create(:category)
      delete :destroy, params: { id: category.to_param }
      expect(response).to redirect_to(categories_url)
    end
  end
end
