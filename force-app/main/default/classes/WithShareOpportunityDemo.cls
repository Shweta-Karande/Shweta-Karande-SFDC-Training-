public with sharing class WithShareOpportunityDemo {
    
  public APEX_Job_Shweta__c ap {get;set;}
  public APEX_Job_Shweta__c apAnother {get;set;}

  public WithShareOpportunityDemo(ApexPages.StandardController controller) {
        ap = [SELECT Name FROM APEX_Job_Shweta__c];

        apAnother = new APEX_Job_Shweta__c();
        apAnother.APEX_Manager__c = 'Fun';
       
    }

}