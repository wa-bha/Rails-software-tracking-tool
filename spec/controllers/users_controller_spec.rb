require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do { full_name: "John Doe" } end
  let(:invalid_attributes) do { full_name: nil } end

  describe "GET #index" do
    it "assigns all users to @users" do
      user = create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :show, params: { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end

    it "renders the show template" do
      user = create(:user)
      get :show, params: { id: user.to_param }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      user = create(:user)
      get :edit, params: { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end

    it "renders the edit template" do
      user = create(:user)
      get :edit, params: { id: user.to_param }
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new user" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, params: { user: valid_attributes }
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid parameters" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, params: { user: invalid_attributes }
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the new template" do
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) do { full_name: "Jane Smith" } end

      it "updates the requested user" do
        user = create(:user)
        put :update, params: { id: user.to_param, user: new_attributes }
        user.reload
        expect(user.full_name).to eq(new_attributes[:full_name])
      end

      it "assigns the requested user as @user" do
        user = create(:user)
        put :update, params: { id: user.to_param, user: new_attributes }
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = create(:user)
        put :update, params: { id: user.to_param, user: new_attributes }
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid parameters" do
      it "assigns the user as @user" do
        user = create(:user)
        put :update, params: { id: user.to_param, user: invalid_attributes }
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the edit template" do
        user = create(:user)
        put :update, params: { id: user.to_param, user: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = create(:user)
      expect {
        delete :destroy, params: { id: user.to_param }
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = create(:user)
      delete :destroy, params: { id: user.to_param }
      expect(response).to redirect_to(users_url)
    end
  end
end
