global class JobScchedularR implements schedulable{
    global void execute(SchedulableContext ctx){
        List<APEX_Job_Shweta__c> lstJob = new List<APEX_Job_Shweta__c>();
        for(APEX_Job_Shweta__c objJob:[SELECT Id, APEX_ExpireOn__c, APEX_Active__c FROM APEX_Job_Shweta__c WHERE APEX_ExpireOn__c<TODAY]){
            objJob.APEX_Active__c=false;
           
            lstJob.add(objJob);
        }
        Database.update(lstJob);
    }
 }