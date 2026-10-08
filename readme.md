# Description of tests
The below shows the number of users, the ramp up time, and the loops for each test.

 - smoke_test.sh - 1 Thread, 1 seconds, 1 loop
 - light_test.sh - 10 Thread, 10 seconds, 1 loop
 - medium_test.sh - 100 Thread, 20 seconds, 1 loop
 - heavy_test.sh - 1000 Thread, 30 seconds, 1 loop
 - insane_test.sh - 100000 Thread, 30 seconds, 1 loop

 # Speeds for speed testing

  - normal - no limit, runs as fast as the machine can
  - slow - 7168 Characters Per Second
  - veryslow - 2048 Characters Per Second

# Running the tests
The scripts can be executed from anywhere but ideally they would be executed from the project folder.

This will run all the tests except the insane_test. It will run each of them in normal, slow, and very slow.

`./tests/all_tests.sh`

# Running individual tests
To run individual tests, call the individual test scripts. They take the speed as an optional parameter. If this parameter is missing it will default to normal.s

`./tests/medium_test.sh normal`
is equilivent to
`./tests/medium_test.sh`

To call a test with slow speed use
`./tests/medium_test.sh slow`

To call a test with very slow speed use
`./tests/medium_test.sh veryslow`

# Results
The results of the tests are stored in the results folder. Each test will create a subfolder to store all its data. These folder have the following naming schema

`threads<number>_rampup<number>_loops<number>_<speed>`

WARNING: Jmeter won't run the test if the output folder for a test is non-empty. This means that in this project you will need to delete the test folder if you want to rerun a specific test.