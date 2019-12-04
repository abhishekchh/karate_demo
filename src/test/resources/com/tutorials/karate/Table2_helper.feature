Feature: Table2 helper

  Background: 
    * table kittens
      | Fname    | job       | index |
      | 'Bob'    | 'Builder' |     2 |
      | 'Matrix' | 'Neo'     |     1 |
      | 'Blue'   | 'Red'     |     3 |
    * def result = call read('table2.feature') kittens

  #  * def created = $result[*].response
  # * match each created == { id: '#number', Fname: '#string', job: '#string' }
  #* match created[*].name contains only ['Bob', 'Wild', 'Nyan']
  Scenario: 
    Given print 'RUNNING TABLE 2'
