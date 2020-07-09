# karate_demo

### HOW to run the tests
>- Once you clone the project you can just type `mvn clean test` to run all the tests.
>- To run a specific feature file we can give the command `mvn test -Dcucumber.options="src/test/resources/com/tutorials/karate/{featureName}.feature"`
>- For running any browser related tests we need to have the Browser-driver in the path variable.
>- To execute the windows UI tests we need to have `developers mode` enabled and we need to have `Windows Application Driver` installed in its default location.

### Where can i find the Results
>- The results are created under the `target` folder. My primary results would be under `target\cucumber-html-reports`


### Parallel Execution of tests
>- Tests are executed in a parallel manner. The number of thread that needs to be used can be defined in `TestRunner` class.
>- to check the execution of each thread we can view the results under `target/surefire-reports/timeline.html`