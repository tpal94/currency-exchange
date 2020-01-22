# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConversionsController, type: :controller do
  before(:each) do
    @conversion = FactoryBot.create(:conversion )
  end

  describe 'GET #new' do
    subject {get :new}

    context 'Should render new template' do
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:new)}
    end
  end

  describe 'GET #index' do
    subject { get :index }

    context 'Should show all the conversions' do
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:index)}
    end

  end

  describe 'POST #create' do
    context 'giving valid params' do
      subject { post :create, params: {conversion: {base_currency: "EUR", base_amount: 5, target_currency: "INR", week_count:6}} } 

      context 'Should create a conversion' do
        it { expect(subject).to redirect_to(conversion_path(Conversion.last.id)) }
        it { expect { subject }.to change(Conversion, :count).by(1) }
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: @conversion.id }  }

    context 'should render edit page' do
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:edit)}
    end
  end

  # describe 'PATCH #update' do
  #   subject { patch :update, params: { conversion: {target_currency: "USD"}, id: @conversion.id }}

  #   context 'Should update the conversion' do
  #     it {expect(@conversion.reload.target_currency).to eq("USD")}
  #     it {expect(subject).to redirect_to(conversion_path(@conversion.id))}
  #     it {expect(subject).to have_http_status(:success)}
  #   end

  # end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: @conversion.id }}

    context 'Should delete conversion' do
      it { expect(subject).to redirect_to(conversions_path) }
      it { expect { subject }.to change(Conversion, :count).by(-1) }
    end
  end
end
