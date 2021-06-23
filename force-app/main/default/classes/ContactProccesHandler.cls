public class ContactProccesHandler{
    @InvocableMethod
    public static void invokeApexClass(List<Contact> lstContact){
         System.debug('lstContact='+lstContact);
        Set<Id> contactIds = new Set<Id>();
        Set<Id> accountIds = new Set<Id>();
        
        for(Contact contact:lstContact){
            contactIds.add(contact.Id);
            accountIds.add(contact.AccountId);
        }
        List<Contact> contacts=[SELECT id, AccountId, address__c FROM Contact WHERE id IN: contactIds];
        Map<Id, Account> accountMap= new Map<Id, Account>([SELECT BillingAddress, ShippingAddress, ShippingStreet FROM Account WHERE id IN:accountIds]);
        System.debug(accountMap.size());
        for(Contact objContact:contacts){
            objContact.address__c=accountMap.get(objContact.AccountId).ShippingStreet;
       }
       // system.debug('Update contact='+contacts);
        Database.update(contacts);
        
   

//System.debug(lsttContact);
     List<String> sentTo = new List<String>();
        for(Contact con : lstContact){
            sentTo.add(con.Email);
        }
        Messaging.SingleEmailMessage msg= new Messaging.SingleEmailMessage();
        msg.setToAddresses(sentTo);
        msg.subject='Your Contact is Succesfully Created';
        msg.plaintextbody='Hello Your Contact is created';
        Messaging.SingleEmailMessage[] msgs = new List<Messaging.SingleEmailMessage>{msg};
            Messaging.SendEmailResult[] results= Messaging.sendEmail(msgs);
        	
    }
}