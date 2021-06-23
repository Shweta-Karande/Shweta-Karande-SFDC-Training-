public class BatchForNullPhoneUpdate implements Database.Batchable<SObject> {
      public static boolean inBatchContext = false;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT id, Phone FROM Contact WHERE Phone = null Limit 100');
    }
    
    public void execute(Database.BatchableContext bc, List<Contact> subLstContact){
        List<Contact> updatList=new  List<Contact>();
        for(Contact objContact:subLstContact){
            objContact.Phone='9876543210';
                updatList.add(objContact);
            
         }
        
        if(updatList.size()>0){
           BatchForNullPhoneUpdate.inBatchContext=true;
        update updatList;
        }
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Successfully Phone is Uploaded');
    }
}