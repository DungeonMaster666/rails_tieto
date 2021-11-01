require "test_helper"

class VacinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacin = vacins(:one)
  end

  test "should get index" do
    get vacins_url
    assert_response :success
  end

  test "should get new" do
    get new_vacin_url
    assert_response :success
  end

  test "should create vacin" do
    assert_difference('Vacin.count') do
      post vacins_url, params: { vacin: { iest_kods: @vacin.iest_kods, iest_nos: @vacin.iest_nos, indik_vakcin: @vacin.indik_vakcin, pers_age: @vacin.pers_age, pers_dzimums: @vacin.pers_dzimums, pers_skaits: @vacin.pers_skaits, prep_daudz: @vacin.prep_daudz, preparat: @vacin.preparat, vacin_date: @vacin.vacin_date, vacin_kartas_num: @vacin.vacin_kartas_num, vacin_posms: @vacin.vacin_posms, vacin_type: @vacin.vacin_type, vakcin_ievade: @vacin.vakcin_ievade } }
    end

    assert_redirected_to vacin_url(Vacin.last)
  end

  test "should show vacin" do
    get vacin_url(@vacin)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacin_url(@vacin)
    assert_response :success
  end

  test "should update vacin" do
    patch vacin_url(@vacin), params: { vacin: { iest_kods: @vacin.iest_kods, iest_nos: @vacin.iest_nos, indik_vakcin: @vacin.indik_vakcin, pers_age: @vacin.pers_age, pers_dzimums: @vacin.pers_dzimums, pers_skaits: @vacin.pers_skaits, prep_daudz: @vacin.prep_daudz, preparat: @vacin.preparat, vacin_date: @vacin.vacin_date, vacin_kartas_num: @vacin.vacin_kartas_num, vacin_posms: @vacin.vacin_posms, vacin_type: @vacin.vacin_type, vakcin_ievade: @vacin.vakcin_ievade } }
    assert_redirected_to vacin_url(@vacin)
  end

  test "should destroy vacin" do
    assert_difference('Vacin.count', -1) do
      delete vacin_url(@vacin)
    end

    assert_redirected_to vacins_url
  end
end
