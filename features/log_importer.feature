Feature: Log Importer

    As a raider
    I want to be able to import log files
    So that I can see an analysis of the events, encounters, and raids contained therein.
    
    Scenario: Import log file
        Given a valid log file
        When it is imported
        Then all of the lines in the file should be imported as events
        
    Scenario: Not associated with an existing raid
        Given a valid log file
        When it is imported
        And it is not associated with an existing raid
        Then a new raid should be created
        And all of the imported events should be associated with the new raid
        
    Scenario: Associated with an existing raid
        Given a valid log file
        When it is imported
        And it is associated with an existing raid
        Then all of the imported events should be associated with the existing raid