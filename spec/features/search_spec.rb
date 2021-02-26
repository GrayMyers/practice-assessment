require "rails_helper"

describe "Search page" do
  describe "happy path" do
    it "has properties of fuel station and directions when given proper params" do
      visit '/'
      expected_text = [
        "Seventeenth Street Plaza",
        "ELEC",
        "MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified",
        '0.081',
        "Start out going southeast on 17th St toward Larimer St/CO-33.",
        "1225 17TH ST is on the right."
      ]
      selector = page.find("#location")
      selector.select("Turing")
      click_button 'Find Nearest Station'
      expected_text.each do |text|
        expect(page).to have_content(text)
      end
    end
  end
end
