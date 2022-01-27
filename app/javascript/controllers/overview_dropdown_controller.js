import { Dropdown } from "tailwindcss-stimulus-components"

// Connects to data-controller="overview-dropdown"
export default class OverviewDropdown extends Dropdown {

    static targets = ['dropdownArrow'];

    openValueChanged() {
        super.openValueChanged();
        if (this.openValue) {
            this.dropdownArrowTarget.classList.add('rotate-180')
        } else {
            this.dropdownArrowTarget.classList.remove('rotate-180')
        }
    }
}