require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  describe '#index' do
    context 'without authentication' do
      before { get :index }
      it { is_expected.to respond_with 401 }
    end

    context 'with admin authentication' do
      before do
        admin_login
        get :index
      end
      it { is_expected.to respond_with 200 }
    end
  end

  describe '#new' do
    context 'without authentication' do
      before { get :new }
      it { is_expected.to respond_with 401 }
    end

    context 'with admin authentication' do
      before do
        admin_login
        get :new
      end
      it { is_expected.to respond_with 200 }
    end
  end

  describe '#show' do
    context 'without authentication' do
      before { get :show, params: { id: 'iphone' }  }
      it { is_expected.to respond_with 401 }
    end

    context 'with admin authentication' do
      before do
        admin_login
        get :show, params: { id: 'iphone' }
      end
      it { is_expected.to respond_with 200 }
    end
  end

  describe '#fetch_cache' do
    let!(:iphone) { FactoryGirl.create(:iphone) }
    context 'without authentication' do
      before { post :fetch_cache, params: { id: iphone.id }  }
      it { is_expected.to respond_with 401 }
    end

    context 'with admin authentication' do
      before do
        admin_login
        allow_any_instance_of(SemanticsService).to receive(:fetch_and_cache)
        post :fetch_cache, params: { id: iphone.id }
      end
      it { is_expected.to redirect_to(admin_product_path(iphone)) }
    end
  end

  describe '#destroy' do
    let!(:iphone) { FactoryGirl.create(:iphone) }
    context 'without authentication' do
      before { delete :destroy, params: { id: iphone.id }  }
      it { is_expected.to respond_with 401 }
    end

    context 'with admin authentication' do
      before do
        admin_login
        delete :destroy, params: { id: iphone.id }
      end
      it { is_expected.to redirect_to(admin_products_path) }
    end
  end

  describe '#create' do
    context 'without authentication' do
      before { post :create, params: { name: 'ipad' } }
      it { is_expected.to respond_with 401 }
    end

    context 'with admin authentication' do
      before do
        admin_login
        allow_any_instance_of(SemanticsService).to receive(:fetch_and_cache)
        post :create, params: { name: 'ipad' }
      end
      it { is_expected.to redirect_to(admin_products_path) }
    end
  end

  def admin_login
    user = 'admin'
    pw = 'admin'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end
