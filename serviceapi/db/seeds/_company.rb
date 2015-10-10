Company.delete_all
company = [
    ["Company_1","company_1@gmail.com","Amstredam","Nederland"],
    ["Company_2","company_2@gmail.com","Mutnik","BiH"],
    ["Company_3","company_3@gmail.com","Buzim","BiH"]
]

company.each do |name,email,city,country|
  Company.create!({name:name,email:email,city:city,country:country})
end