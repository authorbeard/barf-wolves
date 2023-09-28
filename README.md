# barf-wolves
An app for logging volunteer werewolves for a new drug trial.


### Basic description:
A local reputable well known pharmaceutical company has teamed up with a hospital to handle a phase 3 trial of a new drug called Barfemfup.  An announcement will be sent to the public at large looking for volunteers who are suffering from Lycanthropy to participate in the phase 3 trial.  The hospital is located in California, accepting people from any state on the West Coast, because we have Redwood trees.

Volunteers will be asked for their:

First Name, Last Name, Phone Number, Insurance Carrier, and Medical Record ID.

### Acceptance criteria:

- form for volunteers to submit the following: 
  - First Name
  - Last Name
  - Phone Number 
  - Insurance Carrier
  - Medical Record ID.
- Controller action and/or endpoint to accept the data
- action calls provided `send_to_hospital` method with SQL statement
  - SQL should be executable as-is
- App displays thank you page on submission 
  - No validations mentioned; will display this regardless of any errors, etc.
