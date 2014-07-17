require 'test_helper'

class ListaControllerTest < ActionController::TestCase
  setup do
    @listum = lista(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lista)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listum" do
    assert_difference('Listum.count') do
      post :create, listum: { nome: @listum.nome, pax: @listum.pax, sentado: @listum.sentado, sentado_em: @listum.sentado_em }
    end

    assert_redirected_to listum_path(assigns(:listum))
  end

  test "should show listum" do
    get :show, id: @listum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listum
    assert_response :success
  end

  test "should update listum" do
    patch :update, id: @listum, listum: { nome: @listum.nome, pax: @listum.pax, sentado: @listum.sentado, sentado_em: @listum.sentado_em }
    assert_redirected_to listum_path(assigns(:listum))
  end

  test "should destroy listum" do
    assert_difference('Listum.count', -1) do
      delete :destroy, id: @listum
    end

    assert_redirected_to lista_path
  end
end
