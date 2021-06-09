public class CustomControllerJob{
public APEX_Job_Shweta__c job1{get;set;}
      public id jobId{get;set;}
     public CustomControllerJob()
     {
         job1 = new  APEX_Job_Shweta__c();
          jobId= ApexPages.CurrentPage().getParameters().get('id');
         if(jobId!=null)
         {
             job1=[Select Id,APEX_Name__c,APEX_Description__c,APEX_NoOfPosition__c,APEX_ExpireOn__c,APEX_Active__c,APEX_SalaryOffered__c,APEX_Manager__c,APEX_JobPositins__c,APEX_RequiredSkills__c,QualificationRequired__c,CerificationRequired__c FROM APEX_Job_Shweta__c where Id =:jobId];
		}
     }
    
    public void Save()
    {
        insert job1;
        job1=new  APEX_Job_Shweta__c();
    
    }
  
 public void updateMe()
    {
        update job1;
        job1=new  APEX_Job_Shweta__c();
    
    }
    
   



}