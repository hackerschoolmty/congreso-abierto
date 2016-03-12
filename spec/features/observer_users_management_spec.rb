require "rails_helper"

RSpec.feature "Observers user management", :type => :feature do
  
  context "Root user" do 
    
    given!(:root_user) {FactoryGirl.create(:root_user)}
    given!(:observer_user) {FactoryGirl.create(:observer_user)}
    
    background do  
      visit "/"
      click_link "Sign in"
      within("#new_user") do 
        fill_in "Email", with: root_user.email
        fill_in "Password", with: "changeme"
      end
      click_button "Log in"

      expect(page).to have_content "Signed in successfully."

      click_link "Dashboard"
      click_link "Observers"
    end

    scenario "can access observers list" do 
      expect(page).to have_content observer_user.email
    end

    context "creates a new observer" do 

      background do 
        click_link "New Observer"
      end 

      scenario "with valid data" do 
        within("#new_user") do 
          fill_in "First name", with: "Dummy"
          fill_in "Last name", with: "Name"
          fill_in "Email", with: "dummy@gmail.com"
          fill_in "Password", with: "changeme"
          fill_in "Password confirmation", with: "changeme"
        end

        click_button "Create User"
        expect(page).to have_content "Observer created successfully!"
        expect(page).to have_content "dummy@gmail.com"
      end


      scenario "with invalid data" do 
        within("#new_user") do 
          fill_in "First name", with: "Dummy"
          fill_in "Last name", with: "Name"
          fill_in "Email", with: "dummy@gmail.com"
          fill_in "Password", with: "changeme"
          fill_in "Password confirmation", with: "changeme123"
        end

        click_button "Create User"
        expect(page).to have_content "1 error prohibited this User from being saved:"
      end

    end
    
    scenario "can destroy observers" do 
      observer_user = FactoryGirl.create(:observer_user)
      click_link "Observers"

      page.find_link("Delete", {href: admin_observer_path(observer_user)}).click

      expect(page).to have_content "Observer destroyed successfully"
      expect(page).to_not have_content observer_user.email
    end 

    scenario "can activate/deactivate observers" do 
      page.find_link("Deactivate", {href: deactivate_admin_observer_path(observer_user)}).click

      expect(page).to have_content "Observer deactivated successfully!"
      expect(page).to_not have_link("Deactivate", {href: deactivate_admin_observer_path(observer_user)})
    
      page.find_link("Activate", {href: activate_admin_observer_path(observer_user)}).click

      expect(page).to have_content "Observer activated successfully!"
      expect(page).to_not have_link("activate", {href: activate_admin_observer_path(observer_user)})
    end
  end

  context "Observer user" do 

    scenario "is redirected when trying to access observers" do 
      observer_user = FactoryGirl.create(:observer_user)
      visit "/"
      click_link "Sign in"
      within("#new_user") do 
        fill_in "Email", with: observer_user.email
        fill_in "Password", with: "changeme"
      end
      click_button "Log in"

      expect(page).to have_content "Signed in successfully."
      expect(page).to_not have_link "Dashboard"

      visit admin_observers_path
      expect(page).to have_content "You don't have authorization to go there"
    end 

  end


end