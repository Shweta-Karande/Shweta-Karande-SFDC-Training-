@isTest
public class JobTriggerHandlerTestClass {
    @testSetup
    static void inserDataForTest1(){
    Contact contact=new Contact(Lastname='Kanoja');
    insert contact;
    
    List<APEX_Job_Shweta__c> lstJob=new  List<APEX_Job_Shweta__c>();
    lstJob.add(new APEX_Job_Shweta__c(APEX_JobPositins__c='Developer', APEX_Active__c=false, APEX_NoOfPosition__c=5, APEX_Manager__c=contact.Id));
    lstJob.add(new APEX_Job_Shweta__c(APEX_JobPositins__c='Admin', APEX_Active__c=True, APEX_NoOfPosition__c=3, APEX_Manager__c=contact.Id));
    Database.insert(lstJob);
    
    List<Candidate_Shweta__c> lstCandidate= new  List<Candidate_Shweta__c>();
    lstCandidate.add(new Candidate_Shweta__c(APEX_FirstName__c='shweta1', APEX_LastName__c='Karande1',
                                             Country__c='India', APEX_State__c='Maharashtra', 	APEX_ApplicationDate__c=Date.today().addDays(-6), APEX_Status__c='Applied', APEX_Email__c='sbk@gmail.com', 	
                                             APEX_ExpectedSalary__c=50, APEX_JOB_Shwetajob__c=lstJob[1].Id));

    lstCandidate.add(new Candidate_Shweta__c(APEX_FirstName__c='shweta2', APEX_LastName__c='Karande2',
                                             Country__c='India', APEX_State__c='Maharashtra', APEX_ApplicationDate__c=Date.today().addDays(-6), APEX_Status__c='Applied', APEX_Email__c='sbk@gmail.com', 	
                                             APEX_ExpectedSalary__c=null, APEX_JOB_Shwetajob__c=lstJob[0].Id));
    Database.insert(lstCandidate, false);
    }
    
 @isTest
    public static void checkStatus()
    {
         List<APEX_Job_Shweta__c> listJob =[SELECT APEX_Active__c  ,Id FROM APEX_Job_Shweta__c];
        
        for(APEX_Job_Shweta__c jobList: listJob)
        {
            Database.deleteResult result = Database.delete(jobList.Id);
            System.assertEquals(false,!result.isSuccess());
        }
    
       
    	
        
    }
    
    
     

}