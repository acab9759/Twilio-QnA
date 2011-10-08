require File.dirname(__FILE__) + '/../spec_helper'

describe AnswersController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Answer.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Answer.any_instance.stub(:valid?).and_return(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Answer.any_instance.stub(:valid?).and_return(true)
    post :create
    response.should redirect_to(answer_url(assigns[:answer]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Answer.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Answer.any_instance.stub(:valid?).and_return(false)
    put :update, :id => Answer.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Answer.any_instance.stub(:valid?).and_return(true)
    put :update, :id => Answer.first
    response.should redirect_to(answer_url(assigns[:answer]))
  end

  it "destroy action should destroy model and redirect to index action" do
    answer = Answer.first
    delete :destroy, :id => answer
    response.should redirect_to(answers_url)
    Answer.exists?(answer.id).should be_false
  end
end
