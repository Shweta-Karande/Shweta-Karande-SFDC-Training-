public class ContactTriggerHandlerContactUpdate {
    public static boolean inFutureContext = false;
    
    public static void ContactUpdate(List<Contact> lstContact, Map<Id, Contact> mapOldContact ){
        List<ID> lstContactIds=new List<ID>();
        for(Contact objContact : lstContact){
            Contact oldMapContact = mapOldContact.get(objContact.Id);
            if(objContact.Phone!=oldMapContact.Phone){
             	lstContactIds.add(objContact.id);
            }
         }
        if(lstContactIds.size()>0){
            
         ContactTriggerHandlerContactUpdate.ContactUpdateFuture(lstContactIds);
        }
    }
    @Future
     public static void ContactUpdateFuture(List<ID> lstContactId){
        List<Contact> lstContact = [SELECT id, Name, Phone FROM Contact WHERE Id IN : lstContactId];  
        List<Contact> lstContactss=new  List<Contact>();
        for(Contact objContact : lstContact ) {
            objContact.Phone='+91'+ objContact.Phone;
            lstContactss.add(objContact);
        }
        if(lstContactss.size()>0){
            System.debug('Value F1'+ContactTriggerHandlerContactUpdate.inFutureContext);  
            ContactTriggerHandlerContactUpdate.inFutureContext=true;
           System.debug('Value F2'+ContactTriggerHandlerContactUpdate.inFutureContext);  
            update lstContactss;
        }
        
    }
}