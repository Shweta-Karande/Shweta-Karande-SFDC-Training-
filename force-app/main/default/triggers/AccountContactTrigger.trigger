trigger AccountContactTrigger on Account (after update) {
   List<Contact> contactList = new List<Contact>();
   List<Contact> contactList1 = new List<Contact>();
for(Account acc: [SELECT Id,(SELECT Id,checkbox__c FROM Contacts) FROM Account WHERE Id in: Trigger.new]){
   If(acc.Contacts.size()>0){
     contactList.addAll(acc.Contacts);
    }
}
for(contact c:contactList){
       c.checkbox__c=true;
       contactList1.add(c);
}
update contactList1;
}