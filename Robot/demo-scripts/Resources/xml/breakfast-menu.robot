*** Settings ***
Library  XML

*** Variables ***
${XML_MENU_PATH} =  inputs/xml/menu.xml
${EXPECTED_MENU_COUNT} =  1
${EXPECTED_FOOD_COUNT} =  5

*** Keywords ***
Should be one menu in the file
    # since we're passing the file name with no element, we get
    # a count of how many elements are in the file
    ${menu_count} =  Get Element Count  ${XML_MENU_PATH}
    Should Be Equal As Numbers  ${menu_count}  ${EXPECTED_MENU_COUNT}

Verify Menu Name
    ${root} =  Parse XML  ${XML_MENU_PATH}
    Should Be Equal  ${root.tag}  breakfast_menu

Verify Food Count
    # This time, we pass the element name we want to count along with the file name
    ${food_count} =  Get Element Count  ${XML_MENU_PATH}  food
    Should Be Equal As Numbers  ${food_count}  ${EXPECTED_FOOD_COUNT}

Verify First Food Name
    # I would have thought I need to pass breakfast_menu/food[1]/name
    # but that is not the case. Only pass the name of the desired element
    ${first_food_name} =  Get Element  ${XML_MENU_PATH}  food[1]/name
    Should Be Equal As Strings  ${first_food_name.text}  Belgian Waffles

Verify First Food Price
    ${first_food_price} =  Get Element  ${XML_MENU_PATH}  food[1]/price
    Should Be Equal As Strings  ${first_food_price.text}  $5.95

Verify First Food Calories
    ${first_food_calories} =  Get Element  ${XML_MENU_PATH}  food[1]/calories
    Should Be Equal As Strings  ${first_food_calories.text}  650

Add New Food
    ${root} =  Parse XML  ${XML_MENU_PATH}
    Add Element  ${root}  <food>${\n}</food>
    Add Element  ${root}  <name>Grilled Cheese Sandwich</name>  xpath=food[6]
    Add Element  ${root}  <price>$2.95</price>  xpath=food[6]
    Add Element  ${root}  <description>Yummy melted cheese on grilled sourdough slices</description>  xpath=food[6]
    Add Element  ${root}  <calories>300</calories>  xpath=food[6]
    Save XML     ${root}  ${XML_MENU_PATH}

Verify New Food Exists
    Element Should Exist  ${XML_MENU_PATH}  food[6]