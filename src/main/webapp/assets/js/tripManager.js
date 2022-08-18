/**
 * 
 */
function displayDropdownList(event) {
    const dropDown = event.parentElement;
    const dropdownList = dropDown.getElementsByClassName("dropdown-list")[0];
    dropdownList.classList.toggle("show");
    console.log(dropdownList);
}