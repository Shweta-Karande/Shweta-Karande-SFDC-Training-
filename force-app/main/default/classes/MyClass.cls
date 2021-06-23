global with sharing class MyClass {
   public String accountName { get; set; }
    public static Account account { get; set; }
    public MyClass() { } // empty constructor
    
    @RemoteAction
    global static Account getAccount(String accountName) {
        account = [SELECT Id, Name, Phone, Type, NumberOfEmployees 
                   FROM Account WHERE Name = :accountName];
        return account;
    }
}
    
 /*   public static APEX_Job_Shweta__c objJob { get; set; }
    public MyClass() { } // empty constructor
    
   @RemoteAction
    global static void increaseNoOfPosition(){
        APEX_Job_Shweta__c objJob=[SELECT Id, APEX_Name__c, APEX_NoOfPosition__c,APEX_JobPositins__c,APEX_Manager__c FROM APEX_Job_Shweta__c WHERE id=:'a015g00000L58Qt'];
        objJob.APEX_NoOfPosition__c=objJob.APEX_NoOfPosition__c+1;
        update objJob;
        objJob=new APEX_Job_Shweta__c();
    }*/