***************************************************  
###### **Disclaimer**: This repo was created as a code challenge for a potential employer. That means it's generally one- or two-pass work, to an MVP level; either it has been timeboxed in the original description or I have set what I regard as reasonable limits. It is uncompensated work, after all, and frequently goes well beyond the scope that would be acceptable for a ticket in any of the places I've worked before. It frequently lacks requirements or acceptance criteria, too, so I try to make reasonable guesses to fill in the gaps. 

###### At any rate, you can find the task's description at -- get this -- [description.md, in the root directory](./description.md).
*************************************************** 

# barf-wolves
An app for logging volunteer werewolves for a new drug trial for Barfemfup.


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

### Requirements and installation
- Ruby 3.2.0
- Rails 7.0.8

A quick `bundle install` and `bundle exec rails s` is all you need. You can visit `/volunteers` or just `localhost:3000`, since root points to `volunteers`. The rest is fairly self-explanatory.


### Other notes:
- did not have time to set up a testing suite, thought that would have been, in all likelihood, just a couple of request specs to validate:
  - That `File` receives a write call of some sort
  - That `File` receives write with properly-formatted SQL
    - eventually, The parsing, SQL assembly and writing would be handled by at least one other class, otherwise I wouldn't get into testing behavior in private methods
  - That the thank-you message is rendered
  - That the thank-you message is rendered even when there's an error
- The above describes a bit about how I approach testing, which I've only ever done in RSpec, but that short list above would get me started.
- there is an existing `output.sql` showing the output of submitting the form with these values:
```
  first_name: this,
  last_name: effinguy,
  phone_number: 1900-mix-a-lot,
  insurance_carrier: Frodus Conglomerate International,
  medical_record_id: ''
```

### Resources used:
- https://ruby-doc.org/core-3.0.0/File.html (syntax check; couldn't remember exactly what a+t meant, wanted to confirm it would append)
- https://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html (another syntax thing; haven't written a Rails form for awhile and couldn't remember which worked best without an ActiveRecord model)
- https://ruby-doc.org/core-3.0.0/Hash.html#method-i-transform_values (thought that Ruby 3 had changed something on me; did not realize I was calling the wrong method. I had been calling `update_values` instead of `transform_values` and had to go look it up, then pause for awhile and bang my head against the wall)
