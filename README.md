# license-test
License tester client app

### Usage

* Run the license test server from https://github.com/nimbix/jarvice-lic-server and add a configuration

* Launch this app and specify the license token name as the job label, also providing the server address and port e.g 10.0.010:9090 

* Set the number of cores to the number of tokens that should be reserved, and the delay parameter to specify how frequently the reservation is refreshed

* By default the app will retry reservations on failure - set the **Exit on reservation failure** option to make the app exit as soon as reservation fails


A **test.sh** script is present in this apps repository for local testing
