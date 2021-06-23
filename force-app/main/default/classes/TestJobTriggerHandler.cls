@isTest
public class TestJobTriggerHandler {

    @testSetup
    public static void insertData(){
        Contact contact=new Contact(Lastname='Kanoja', Email='shwetabkarande04@gmail.com');
        insert contact;
        
        List<APEX_Job_Shweta__c> lstJob=new  List<APEX_Job_Shweta__c>();
        lstJob.add(new APEX_Job_Shweta__c(APEX_JobPositins__c='Developer', APEX_Active__c=false, APEX_NoOfPosition__c=2, APEX_Manager__c=contact.Id));
        lstJob.add(new APEX_Job_Shweta__c(APEX_JobPositins__c='Admin', APEX_Active__c=true, APEX_NoOfPosition__c=2, APEX_Manager__c=contact.Id));
        Database.insert(lstJob);
        
    }
    @isTest 
    static void testStatusActiveCanNotDeleted(){
        List<APEX_Job_Shweta__c> lstJob=[SELECT APEX_Active__c, ID FROM APEX_Job_Shweta__c WHERE APEX_Active__c=true];
        Database.DeleteResult result=Database.delete(lstJob[0].ID, false);
        System.assertEquals(false, result.isSuccess());
    }
    
    @isTest
    public static void testDeactiveJob(){
        List<APEX_Job_Shweta__c> lstJob=[SELECT APEX_Active__c, id, APEX_NoOfPosition__c, APEX_HiredApplicant__c FROM APEX_Job_Shweta__c WHERE APEX_Active__c=true];
        List<Candidate_Shweta__c> lstCandidate=new List<Candidate_Shweta__c>();
        lstCandidate.add(new Candidate_Shweta__c(APEX_FirstName__c='shweta1', APEX_LastName__c='Karande1',
                                                 Country__c='India', APEX_State__c='Maharashtra', APEX_ApplicationDate__c=Date.today().addDays(-6), APEX_Status__c='Applied', APEX_Email__c='sbk@gmail.com',    
                                                 APEX_ExpectedSalary__c=50, APEX_JOB_Shwetajob__c=lstJob[0].Id));
        
        lstCandidate.add(new Candidate_Shweta__c(APEX_FirstName__c='shweta2', APEX_LastName__c='Karande2',
                                                 Country__c='India', APEX_State__c='Maharashtra', APEX_ApplicationDate__c=Date.today().addDays(-6), APEX_Status__c='Applied', APEX_Email__c='sbk@gmail.com',    
                                                 APEX_ExpectedSalary__c=85, APEX_JOB_Shwetajob__c=lstJob[1].Id));
        
        Database.SaveResult[] result=Database.insert(lstCandidate);
        APEX_Job_Shweta__c objJob=[SELECT APEX_HiredApplicant__c, APEX_Active__c FROM APEX_Job_Shweta__c WHERE APEX_HiredApplicant__c=2];
        System.assertEquals(false, objJob.APEX_Active__c);
    }
    @isTest
    public static void testMakeActive(){
        List<APEX_Job_Shweta__c> lstJob=[SELECT APEX_Active__c, id,APEX_NoOfPosition__c FROM APEX_Job_Shweta__c WHERE APEX_Active__c=true];
        List<Candidate_Shweta__c> lstCandidate=new List<Candidate_Shweta__c>();
        
        lstCandidate.add(new Candidate_Shweta__c(APEX_FirstName__c='shweta1', APEX_LastName__c='Karande1',
                                                 Country__c='India', APEX_State__c='Maharashtra', APEX_Status__c='Hired', APEX_ApplicationDate__c=Date.today().addDays(-6), APEX_Email__c='sbk@gmail.com',  
                                                 APEX_ExpectedSalary__c=50, APEX_JOB_Shwetajob__c=lstJob[1].Id));
        
        lstCandidate.add(new Candidate_Shweta__c(APEX_FirstName__c='shweta2', APEX_LastName__c='Karande2',
                                                 Country__c='India', APEX_State__c='Maharashtra', APEX_Status__c='Hired', APEX_ApplicationDate__c=Date.today().addDays(-6), APEX_Email__c='sbk@gmail.com',  
                                                 APEX_ExpectedSalary__c=25, APEX_JOB_Shwetajob__c=lstJob[0].Id));
        
        Database.SaveResult[] result=Database.insert(lstCandidate);
        APEX_Job_Shweta__c objJob=[SELECT APEX_HiredApplicant__c, APEX_Active__c, APEX_NoOfPosition__c FROM APEX_Job_Shweta__c WHERE APEX_HiredApplicant__c=2];
        System.assertEquals(false, objJob.APEX_Active__c);
        objJob.APEX_NoOfPosition__c=objJob.APEX_NoOfPosition__c+1;
        Database.SaveResult resul=Database.update(objJob);
        APEX_Job_Shweta__c objectJob=[SELECT APEX_HiredApplicant__c, APEX_Active__c, APEX_NoOfPosition__c FROM APEX_Job_Shweta__c WHERE APEX_HiredApplicant__c=2];
        System.assertEquals(true, objectJob.APEX_Active__c);
    }
}