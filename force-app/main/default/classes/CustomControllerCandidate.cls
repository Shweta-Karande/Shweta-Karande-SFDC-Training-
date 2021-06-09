public class CustomControllerCandidate{
public Candidate_Shweta__c candidate1{get;set;}
    public id candidateId{get;set;}
     public CustomControllerCandidate()
     {
         candidate1 = new  Candidate_Shweta__c();
         candidateId= ApexPages.CurrentPage().getParameters().get('id');
         if(candidateId!=null)
         {
             candidate1=[Select Id, APEX_Salutation__c,APEX_FirstName__c,APEX_LastName__c,APEX_FullName__c,APEX_DateOFBirth__c,APEX_ApplicationDate__c,APEX_Email__c,Country__c,APEX_State__c,APEX_ExpectedSalary__c,APEX_JOB_Shwetajob__c FROM Candidate_Shweta__c where Id =:candidateId];
		}
     }
    
    public void Save()
    {
        insert  candidate1;
        candidate1=new Candidate_Shweta__c();
    
    }
  
    public void updateMe()
    {
        System.debug(candidate1);
        update  candidate1;
        candidate1=new  Candidate_Shweta__c();
    
    }
  
}