public class allJobs {
  /*  public ApexPages.StandardSetController setCon {
    get{
        if(setCon==null){
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                [SELECT APEX_Name__c, APEX_NoOfPosition__c,APEX_JobPositins__c,APEX_Manager__c FROM APEX_Job_Shweta__c ]));
            }
            return setCon;
        }
        set;
    }
    
    public List<APEX_Job_Shweta__c> getOpportunities(){
    
     return (List<APEX_Job_Shweta__c > )setCon.getRecords();
    
   }*/
    public APEX_Job_Shweta__c jobObj{get;set;}
      public List<sObject> records{get;set;}

    public List<String> fields{get;set;}

    public allJobs(){
		jobObj=[SELECT APEX_Name__c, APEX_NoOfPosition__c,APEX_JobPositins__c,APEX_Manager__c FROM APEX_Job_Shweta__c WHERE id=:'a015g00000L58Qt'];
        records= [Select APEX_Salutation__c,APEX_FirstName__c,APEX_LastName__c,APEX_FullName__c,APEX_DateOFBirth__c,APEX_ApplicationDate__c,APEX_Email__c,Country__c,APEX_State__c,APEX_ExpectedSalary__c,APEX_JOB_Shwetajob__c FROM Candidate_Shweta__c WHERE APEX_JOB_Shwetajob__c=:'a015g00000L58Qt'];

      fields = new List<String>{'APEX_Salutation__c', 'APEX_FirstName__c','APEX_LastName__c','APEX_FullName__c','APEX_DateOFBirth__c','APEX_ApplicationDate__c','APEX_Email__c','Country__c','APEX_State__c','APEX_ExpectedSalary__c','APEX_JOB_Shwetajob__c'};
		
    }
 
}