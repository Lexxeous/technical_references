*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  prod

# Note that the "dev" and "qa" environments of cars.com do not exist, but are used only for dictionary demonstration
&{BASE_URL}  dev=https://dev.cars.com/  qa=https://qa.cars.com/  prod=https://www.cars.com/
${LOGIN_URL} =  /signin

# Input Data
&{UNREGISTERED_USER}  Email=admin@robotframeworktutorial.com  Password=AdminPassword!  ExpectedErrorMessage=We were unable to sign you in.
&{INVALID_PASSWORD_USER}  Email=test@gmail.com  Password=TestPassword!  ExpectedErrorMessage=We were unable to sign you in.
&{BLANK_CREDENTIALS_USER}  Email=#BLANK  Password=#BLANK  ExpectedErrorMessage=We were unable to sign you in.

@{ATTEMPT_DATA} =  ${UNREGISTERED_USER}  ${INVALID_PASSWORD_USER}  ${BLANK_CREDENTIALS_USER}