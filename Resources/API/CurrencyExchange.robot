*** Settings ***
Library    RequestsLibrary
Library    ../../Libraries/MyCustomPyLibrary.py

*** Keywords ***
Retrieve Multiple Exchange Rates
    [Documentation]    Get exchange rates
    FOR     ${i}    IN RANGE   ${LOOP}
	    ${currencies} =     generate random currency list
        FOR     ${currency}     IN      @{currencies}
            ${from_currency} =      set variable    ${currency[0]}
            ${to_currency} =      set variable    ${currency[1]}
            ${get_uri} =  set variable    /currency-exchange/from/${from_currency}/to/${to_currency}

            ${response} =   get on session    api_gateway   ${get_uri}
            Expect Response  ${response}     200
            log to console    ---@@@ ${i}:${response.json()}
        END
    END

Convert Currencies Using Rest Template
    [Documentation]    Convert currencies using Rest Template URL
    FOR     ${i}    IN RANGE   ${LOOP}
	    ${currencies} =     generate random currency list
        FOR     ${currency}     IN      @{currencies}
            ${from_currency} =      set variable    ${currency[0]}
            ${to_currency} =      set variable    ${currency[1]}
            ${quantity} =   generate random quantity
            ${get_uri} =  set variable    /currency-conversion/from/${from_currency}/to/${to_currency}/quantity/${quantity}

            ${response} =   get on session    api_gateway   ${get_uri}
            Expect Response  ${response}     200
            log to console    ---@@@ ${i}:${response.json()}
        END
    END

Convert Currencies Using Feign
    [Documentation]    Convert currencies using feign URL
    FOR     ${i}    IN RANGE   ${LOOP}
	    ${currencies} =     generate random currency list
        FOR     ${currency}     IN      @{currencies}
            ${from_currency} =      set variable    ${currency[0]}
            ${to_currency} =      set variable    ${currency[1]}
            ${quantity} =   generate random quantity
            ${get_uri} =  set variable    /currency-conversion-feign/from/${from_currency}/to/${to_currency}/quantity/${quantity}

            ${response} =   get on session    api_gateway   ${get_uri}
            Expect Response  ${response}     200
            log to console    ---@@@ ${i}:${response.json()}
        END
    END

Expect Response
    [Documentation]    Checks the response against expectaion
    [Arguments]    ${response}  ${expected_code}
    should be equal as strings  ${response.status_code}     ${expected_code}