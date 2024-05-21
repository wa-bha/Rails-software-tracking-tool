require "rails_helper"

RSpec.describe ToolsController, type: :controller do
  let(:category) { create(:category) }
  let(:valid_attributes) { { name: "Tool Name", category_id: category.id } }
  let(:invalid_attributes) { { name: nil, category_id: category.id } }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns all tools to @tools" do
      tool = Tool.create!(valid_attributes)
      get :index
      expect(assigns(:tools)).to eq([tool])
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new tool to @tool" do
      get :new
      expect(assigns(:tool)).to be_a_new(Tool)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new tool" do
        expect {
          post :create, params: { tool: valid_attributes }
        }.to change(Tool, :count).by(1)
      end

      it "redirects to the tools index" do
        post :create, params: { tool: valid_attributes }
        expect(response).to redirect_to(tools_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new tool" do
        expect {
          post :create, params: { tool: invalid_attributes }
        }.to_not change(Tool, :count)
      end

      it "renders the new template" do
        post :create, params: { tool: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    let(:tool) { Tool.create!(valid_attributes) }

    it "returns a successful response" do
      get :edit, params: { id: tool.id }
      expect(response).to be_successful
    end

    it "assigns the requested tool to @tool" do
      get :edit, params: { id: tool.id }
      expect(assigns(:tool)).to eq(tool)
    end
  end

  describe "PUT #update" do
    let(:tool) { Tool.create!(valid_attributes) }

    context "with valid parameters" do
      it "updates the requested tool" do
        new_name = "Updated Tool Name"
        put :update, params: { id: tool.id, tool: { name: new_name } }
        tool.reload
        expect(tool.name).to eq(new_name)
      end

      it "redirects to the tools index" do
        put :update, params: { id: tool.id, tool: valid_attributes }
        expect(response).to redirect_to(tools_path)
      end
    end

    context "with invalid parameters" do
      it "does not update the requested tool" do
        old_name = tool.name
        put :update, params: { id: tool.id, tool: invalid_attributes }
        tool.reload
        expect(tool.name).to eq(old_name)
      end

      it "renders the edit template" do
        put :update, params: { id: tool.id, tool: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:tool) { Tool.create!(valid_attributes) }

    it "destroys the requested tool" do
      expect {
        delete :destroy, params: { id: tool.id }
      }.to change(Tool, :count).by(-1)
    end

    it "redirects to the tools index" do
      delete :destroy, params: { id: tool.id }
      expect(response).to redirect_to(tools_path)
    end
  end
end
