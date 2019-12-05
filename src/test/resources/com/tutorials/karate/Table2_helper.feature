Feature: Table2 helper

  Background: 
    * table Person
      | Fname    | job       | index |
      | 'Bob'    | 'Builder' |     2 |
      | 'Matrix' | 'Neo'     |     1 |
      | 'Blue'   | 'Red'     |     3 |
    * def result = call read('table2.feature') Person
    * print result
  Scenario: 
    Given print 'RUNNING TABLE 2'
