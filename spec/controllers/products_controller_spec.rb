require 'rails_helper'

describe ProductsController do
  let!(:product) { create(:product) }

  describe 'admin activities should' do
    login_user(:admin)

    it 'get new' do
      expect(@ability.can? :new, Product).to be true
      expect(get :new).to render_template(:new)
    end

    it 'create' do
      expect(@ability.can? :create, Product).to be true
      expect{ post :create, params: { product: attributes_for(:product) } }.to change(Product, :count).by(1)
      expect(response).to redirect_to(assigns(:product))
    end
  end

  describe "user with :default role activities should" do
    login_user

    it 'not get new' do
      expect(@ability.cannot? :new, Product).to be true
      expect{ get :new }.to raise_error(CanCan:: AccessDenied)
    end

    it 'not get create' do
      expect(@ability.can? :create, Product).to be false
      expect{ post :create, params: { product: attributes_for(:product) } }.to raise_error(CanCan:: AccessDenied)
      expect{ response }.to change(Product, :count).by(0)
    end

    it 'show' do
      expect(@ability.can? :show, product).to be true
      expect(get :show, params: { id: product }).to render_template(:show)
    end
  end

  describe 'unreg user activities should' do
    it('index') { expect(get :index).to render_template(:index) }

    describe 'not' do
      it('new') { expect{ get :new }.to raise_error(CanCan:: AccessDenied) }
      it 'create' do
        expect{ post :create, params: { product: attributes_for(:product) } }.to raise_error(CanCan:: AccessDenied)
        expect{ response }.to change(Product, :count).by(0)
      end
    end
  end
end
