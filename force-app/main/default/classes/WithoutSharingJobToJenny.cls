public without sharing class WithoutSharingJobToJenny {
  public Integer intCount {get;set;}
    
    public WithoutSharingJobToJenny() {
        intCount = [ SELECT COUNT() FROM APEX_Job_Shweta__c ];
    }


}