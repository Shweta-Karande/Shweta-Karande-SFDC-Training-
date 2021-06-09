@isTest
public class CandidateTriggerHandlerTestClass {
    @testSetup
    static void inserDataForTest(){
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
    public static void salaryNotNull(){
        List<APEX_Job_Shweta__c> lstJob=[SELECT Id FROM APEX_Job_Shweta__c];
        List<Candidate_Shweta__c> lstCandidate=new List<Candidate_Shweta__c>();
        
        lstCandidate.add(new Candidate_Shweta__c(APEX_FirstName__c='Test1', APEX_LastName__c='Last1',
                                             Country__c='India', APEX_State__c='Maharashtra', 	APEX_ApplicationDate__c=Date.today().addDays(-6), APEX_Status__c='Applied', APEX_Email__c='sbk@gmail.com', 	
                                             APEX_ExpectedSalary__c=50, APEX_JOB_Shwetajob__c=lstJob[1].Id));

    	lstCandidate.add(new Candidate_Shweta__c(APEX_FirstName__c='Test2', APEX_LastName__c='Last2',
                                             Country__c='India', APEX_State__c='Maharashtra', APEX_ApplicationDate__c=Date.today().addDays(-6), APEX_Status__c='Applied', APEX_Email__c='sbk@gmail.com', 	
                                             APEX_ExpectedSalary__c=null, APEX_JOB_Shwetajob__c=lstJob[0].Id));
        
        Database.SaveResult[] result = Database.insert(lstCandidate, false);
        System.assertEquals(false, result[1].isSuccess());
        
       
        
    }
    
    @isTest
    public static void testApplicationDate()
    {
        List<Candidate_Shweta__c> lstCandidate =[SELECT APEX_ApplicationDate__c FROM Candidate_Shweta__c];
            for(Candidate_Shweta__c objCandidate : lstCandidate)
        	{
            	System.assertEquals(Date.today(), objCandidate.APEX_ApplicationDate__c);
			}
    }
    
    @isTest
    public static void testJobNotActiveNotApply(){
         List<APEX_Job_Shweta__c> objJob=[SELECT APEX_Active__c, Id FROM APEX_Job_Shweta__c];
         Candidate_Shweta__c candidate = new Candidate_Shweta__c(APEX_FirstName__c='pratibha1', APEX_LastName__c='Karande1',
                                             Country__c='India', APEX_State__c='Maharashtra', 	APEX_ApplicationDate__c=Date.today().addDays(-6),
                                             APEX_Status__c='Applied', APEX_Email__c='sbk@gmail.com', 	
                                             APEX_ExpectedSalary__c=null, APEX_JOB_Shwetajob__c=objJob[1].Id);
        
        Database.SaveResult result=Database.insert(candidate, false);
        System.assertEquals(false, result.isSuccess());
       }
    
}