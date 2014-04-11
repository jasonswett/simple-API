require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ListingsController do
  render_views

  # This should return the minimal set of attributes required to create a valid
  # Listing. As you add validations to Listing, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "Jason's House", "price" => "9238" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ListingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET show" do
    it "shows an individual listing" do
      get :show, { slug: "hawaii-bungalo", format: :json }, valid_session
      expect(response.body).to eq('{"name":"Hawaii Bungalo","price":"145.0"}')
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Listing" do
        expect {
          post :create, {:listing => valid_attributes}, valid_session
        }.to change(Listing, :count).by(1)
      end

      it "assigns a newly created listing as @listing" do
        post :create, {:listing => valid_attributes}, valid_session
        assigns(:listing).should be_a(Listing)
        assigns(:listing).should be_persisted
      end

      it "shows the created listing" do
        post :create, {:listing => valid_attributes, format: :json}, valid_session
        expect(response.body).to eq('{"name":"Jason\'s House","price":"9238.0"}')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved listing as @listing" do
        # Trigger the behavior that occurs when invalid params are submitted
        Listing.any_instance.stub(:save).and_return(false)
        post :create, {:listing => { "name" => "invalid value" }}, valid_session
        assigns(:listing).should be_a_new(Listing)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Listing.any_instance.stub(:save).and_return(false)
        post :create, {:listing => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

end
