@announce
Feature: Support for multiple configuration files
  In order to quickly change between different configurations
  As a chemistry kit harness developer
  I want to specify different configuration files on the command line

  Background:
    Given I run `ckit new config-test`
    And I cd to "config-test"
    And a file named "beakers/test_beaker.rb" with:
    """
    describe "Cheese", :depth => 'shallow' do
      it "loads an external web page" do
        @driver.get "http://www.google.com"
        @driver.title.should include("Google")
      end
    end
    """
  Scenario: The default will be conifg.yaml
    Given a directory named "evidence_config"
    When I overwrite config.yaml with:
      """
      selenium_connect:
          log: 'evidence_config'
          host: 'localhost'
      """
    When I run `ckit brew`
    Then the stdout should contain "1 example, 0 failures"
    And the following files should exist:
      | evidence_config/cheese/cheese_loads_an_external_web_page/server.log |

  Scenario: I can specifiy an alternative configuration with --config
    Given a directory named "evidence_alternate"
    And a file named "alternate.yaml" with:
      """
      selenium_connect:
          log: 'evidence_alternate'
          host: 'localhost'
      """
      When I run `ckit brew --config alternate.yaml`
      Then the stdout should contain "1 example, 0 failures"
      And the following files should exist:
        | evidence_alternate/cheese/cheese_loads_an_external_web_page/server.log |

  Scenario: I can specifiy an alternative configuration with -c
    Given a directory named "evidence_alternate"
    And a file named "alternate.yaml" with:
      """
      selenium_connect:
          log: 'evidence_alternate'
          host: 'localhost'
      """
      When I run `ckit brew -c alternate.yaml`
      Then the stdout should contain "1 example, 0 failures"
      And the following files should exist:
       | evidence_alternate/cheese/cheese_loads_an_external_web_page/server.log |
  Scenario: I can specifiy an alternative configuration with --config with concurrency
    Given a directory named "evidence_alternate"
    And a file named "alternate.yaml" with:
      """
      concurrency: 4
      selenium_connect:
          log: 'evidence_alternate'
          host: 'localhost'
      """
      When I run `ckit brew --config alternate.yaml`
      Then the stdout should contain "1 example, 0 failures"
      And the following files should exist:
      | evidence_alternate/cheese/cheese_loads_an_external_web_page/server.log |
