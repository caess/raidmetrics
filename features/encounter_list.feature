Feature: Encounter List Page

    So that I can see the encounters for a raid that has been imported
    When I go to the raid's page
    I want to see the list of encounters for that raid.
    
    Scenario: Raid has encounters
        Given that a raid has been imported
        And that the raid has encounters
        When I request the page for the raid
        Then all encounters for that raid should be displayed
        
    Scenario: Raid has no encounters
        Given that a raid has been imported
        And that the raid does not have encounters
        When I request the page for the raid
        Then "This raid has no encounters." should be displayed
        
    Scenario: Show raid note
        Given that a raid has been imported
        When I request the page for the raid
        Then the note for the raid should be displayed