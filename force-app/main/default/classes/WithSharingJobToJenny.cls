public with sharing class WithSharingJobToJenny {
 public Integer intCount {get;set;}
    
    public WithSharingJobToJenny() {
        intCount = [ SELECT COUNT() FROM APEX_Job_Shweta__c ];
    }
       
       /* public List<APEX_Job_Shweta__c> lstJob {get;set;}
    
    public List<APEX_Job_Shweta__c> getAllJobs(){
        lstJob=[SELECT Name FROM APEX_Job_Shweta__c];
        return lstJob;
    }*/
    

}