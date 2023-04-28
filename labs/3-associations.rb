# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

salespeople = Salesperson.all
for person in salespeople
    first_salesperson_id = person["id"]
    break
end

contacts = Contact.all
contact_ids = Array.new
index = 0
for person in contacts
    contact_ids[index] = person["id"]
    index = index + 1
end

new_activity = Activity.new
new_activity["salesperson_id"] = first_salesperson_id
new_activity["contact_id"] = contact_ids[0]
new_activity["note"] = "Said hello"
new_activity.save

new_activity = Activity.new
new_activity["salesperson_id"] = first_salesperson_id
new_activity["contact_id"] = contact_ids[1]
new_activity["note"] = "Said bye"
new_activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

activities = Activity.all
for activity in activities
    salesperson = Salesperson.find_by({"id" => activity["salesperson_id"]})
    contact = Contact.find_by({"id" => activity["contact_id"]})
    puts salesperson
    # puts "Activities between #{salesperson["first_name"]} and #{contact["first_name"]}:"
    # puts "- #{activity["note"]}"
end


# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
