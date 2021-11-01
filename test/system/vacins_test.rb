require "application_system_test_case"

class VacinsTest < ApplicationSystemTestCase
  setup do
    @vacin = vacins(:one)
  end

  test "visiting the index" do
    visit vacins_url
    assert_selector "h1", text: "Vacins"
  end

  test "creating a Vacin" do
    visit vacins_url
    click_on "New Vacin"

    fill_in "Iest kods", with: @vacin.iest_kods
    fill_in "Iest nos", with: @vacin.iest_nos
    fill_in "Indik vakcin", with: @vacin.indik_vakcin
    fill_in "Pers age", with: @vacin.pers_age
    fill_in "Pers dzimums", with: @vacin.pers_dzimums
    fill_in "Pers skaits", with: @vacin.pers_skaits
    fill_in "Prep daudz", with: @vacin.prep_daudz
    fill_in "Preparat", with: @vacin.preparat
    fill_in "Vacin date", with: @vacin.vacin_date
    fill_in "Vacin kartas num", with: @vacin.vacin_kartas_num
    fill_in "Vacin posms", with: @vacin.vacin_posms
    fill_in "Vacin type", with: @vacin.vacin_type
    fill_in "Vakcin ievade", with: @vacin.vakcin_ievade
    click_on "Create Vacin"

    assert_text "Vacin was successfully created"
    click_on "Back"
  end

  test "updating a Vacin" do
    visit vacins_url
    click_on "Edit", match: :first

    fill_in "Iest kods", with: @vacin.iest_kods
    fill_in "Iest nos", with: @vacin.iest_nos
    fill_in "Indik vakcin", with: @vacin.indik_vakcin
    fill_in "Pers age", with: @vacin.pers_age
    fill_in "Pers dzimums", with: @vacin.pers_dzimums
    fill_in "Pers skaits", with: @vacin.pers_skaits
    fill_in "Prep daudz", with: @vacin.prep_daudz
    fill_in "Preparat", with: @vacin.preparat
    fill_in "Vacin date", with: @vacin.vacin_date
    fill_in "Vacin kartas num", with: @vacin.vacin_kartas_num
    fill_in "Vacin posms", with: @vacin.vacin_posms
    fill_in "Vacin type", with: @vacin.vacin_type
    fill_in "Vakcin ievade", with: @vacin.vakcin_ievade
    click_on "Update Vacin"

    assert_text "Vacin was successfully updated"
    click_on "Back"
  end

  test "destroying a Vacin" do
    visit vacins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vacin was successfully destroyed"
  end
end
