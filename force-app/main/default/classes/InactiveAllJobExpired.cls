global class InactiveAllJobExpired implements Schedulable {
    global void execute(SchedulableContext ctx) {
       List<APEX_Job_Shweta__c> lstJob=[SELECT id, APEX_ExpireOn__c FROM APEX_Job_Shweta__c WHERE APEX_ExpireOn__c=Today];
        
        for(APEX_Job_Shweta__c objJob:lstJob){
             objJob.APEX_Active__c=false;
        }
            update lstJob;
      } 


}