@Clockify
Feature: Clockify
  As an api user I want to execute request in order to get proper responses


  Scenario Outline: Get All My Workspaces
    Given An account created in Clockify and x-api-key '<token>' generated
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained
    Then Obtengo los datos de mi Workspace

    Examples:
      | operation | entity    | jsonName         | statusCode | token                                            |
      | GET       | WORKSPACE | getAllWorkspaces | 200        | MWQ4ODMwYmYtMGQyOC00OWYyLWIzYjAtYWEzNjI4MWM4ZmUx |

  Scenario Outline: Get Client for Workspace
    Given An account created in Clockify and x-api-key 'MWQ4ODMwYmYtMGQyOC00OWYyLWIzYjAtYWEzNjI4MWM4ZmUx' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspaces' and ''
    And status code 200 is obtained
    And obtengo un workspaceId
    And tengo un nombre de cliente <name>
    When I perform a 'POST' to '<entity>' endpoint with the 'addClient' and ''
    Then status code 201 is obtained
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained
    And el nombre del cliente es <name>
    Examples:
      | operation | entity | jsonName               | statusCode | name        |
      | GET       | CLIENT | getClientsForWorkspace | 200        | newClient01 |
