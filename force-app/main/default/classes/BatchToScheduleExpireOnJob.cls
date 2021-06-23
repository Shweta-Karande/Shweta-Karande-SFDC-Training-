public class BatchToScheduleExpireOnJob implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT id, APEX_ExpireOn__c, APEX_Active__c FROM APEX_Job_Shweta__c');
            }
    
    public void execute(Database.BatchableContext bc, List<APEX_Job_Shweta__c> subLstJob){
        for(APEX_Job_Shweta__c objJob:subLstJob){
            if(objJob.APEX_ExpireOn__c<Date.today()){
                objJob.APEX_Active__c=false;
            }
         }
          Update subLstJob;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('All job Scheduled successfully');
    }
}