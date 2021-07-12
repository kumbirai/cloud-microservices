*** Settings ***
Documentation    This is a test suite for the spring cloud microservices going through the API Gateway
Resource    ../Resources/API/CurrencyExchange.robot
Suite Setup	Create Session	api_session	http://localhost:8765

# Running the test
# robot -d results tests/CloudMicroservice.robot
# robot -d results tests

*** Variables ***
${LOOP} =    5

*** Test Cases ***
Get Currency Exchange Rates
    [Tags]    API
    [Documentation]    Calls the currency exchange microservice to retrieve exchange rates
    Retrieve Multiple Exchange Rates

Convert Multiple Currencies
    [Tags]    API
    [Documentation]    Calls the currency conversion microservice to convert currencies
    Convert Currencies
