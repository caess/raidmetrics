Feature: Raid List Page

    So that I can know which raids have statistics available
    As a raider
    I want to see the list of raids that have been imported
    
    Scenario: Raids have been analyzed
        Given that raids have been analyzed
        When I request a list of raids
        Then all raids should be displayed
        
    Scenario: Raids have not been analyzed
        Given that no raids have been analyzed
        When I request a list of raids
        Then "There are no raids currently analyzed." should be displayed