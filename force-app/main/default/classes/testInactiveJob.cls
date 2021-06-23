@isTest
public class testInactiveJob {
    @testSetup
    static void setUp(){
        Contact contact = new Contact(LastName='Bari');
        insert contact;
        List<APEX_Job_Shweta__c> lstJob=new List<APEX_Job_Shweta__c>();
        lstJob.add(new APEX_Job_Shweta__c(APEX_ExpireOn__c=System.today(),APEX_JobPositins__c='Admin',APEX_NoOfPosition__c=5,APEX_Manager__c=contact.Id));
        lstJob.add(new APEX_Job_Shweta__c(APEX_ExpireOn__c=System.today(),APEX_JobPositins__c='Manager',APEX_NoOfPosition__c=6,APEX_Manager__c=contact.Id));
        lstJob.add(new APEX_Job_Shweta__c(APEX_ExpireOn__c=System.today(),APEX_JobPositins__c='Admin',APEX_NoOfPosition__c=7,APEX_Manager__c=contact.Id));
        insert lstJob;
    }
    
  /*  String CRON_Exp='0 0 0 3 9 ? 2022';
  	 List<APEX_Job_Shweta__c> lstJob=[SELECT Id, Status_c, APEX_ExpireOn__c FROM APEX_Job_Shweta__c WHERE APEX_ExpireOn__c<TODAY];
  	 String jobId=System.Schedulable('Apex Test ' CRON_Exp, new JobScchedularR());
    System.assertEquals(CRON_EXP,ct.CronExpression);
    System.assertEquals(0.ct.TimesTriggered);
    System.assertEquals('2022-09-03 00:00:00', String.valueOf(ct.NextFireTime));
  	 */
   
    

}