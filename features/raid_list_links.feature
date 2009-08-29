Feature: Raid List Links

    So that I can see the encounter list for each raid
    As a raider
    I want to be able to click on a link to go to the encounter list for a raid from the raid list.

    Scenario:
        Given that raids have been analyzed
        When I request a list of raids
        Then all raids should be displayed
        And all raids should have a link to their encounter list.