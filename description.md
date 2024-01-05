The Story:

A local reputable well known pharmaceutical company has teamed up with a hospital to handle a phase 3 trial of a new drug called Barfemfup.  An announcement will be sent to the public at large looking for volunteers who are suffering from Lycanthropy to participate in the phase 3 trial.  The hospital is located in California, accepting people from any state on the West Coast, because we have Redwood trees.

Volunteers will be asked for their:

First Name, Last Name, Phone Number, Insurance Carrier, and Medical Record ID.

This information will be accepted over a 1 page website form, asking for the above 5 fields and then, due to some archaic oddities, sent via ftp batch upload to the hospital database via an import of sql statements.

This will be exported by a cron job, once a day on the same server as your code..

You have been contracted by a low level flunky on a 1099-Misc basis to create a Ruby on rails program to accept the data on a single page, accept the submit, and then present a thank you page.  If this project goes well, future work will be coming!

---

### cronjob

```
#!/bin/bash
curl -T output.sql ftp://admin:admin@ftp.hospital.com/lycanthropy/
rm output.sql
```

---

Your code will be responsible for calling the below function, which will just write a sql line to the file.

```
# @param [String] sql
#   Ex: "insert into volunteers (first_name, last_name, phone_number, insurance_carrier, medical_id), values('daniel', 'lo', '000-000-0000', 'fruitcake',' 123')"
# @return [Boolean]
def send_to_hospitial(sql)
  Rails.logger.debug(sql)
  File.open('output.sql', 'a+t') do | file |
    file.puts sql
  end
  true
end
```  

Do not use more than 30 minutes to complete this story.  Any part you cannot complete or have additional thoughts about, can be written down as a comment. IE: