public class getAllJobs{
  public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [
                     SELECT APEX_Name__c, APEX_SalaryOffered__c,APEX_Active__c, APEX_ExpireOn__c,
                     APEX_NoOfPosition__c,APEX_ApplicantCout__c,
                     APEX_JobPositins__c, APEX_Manager__c FROM APEX_Job_Shweta__c where id='a015g00000LWrdF'
                     
                    ]
                ));
            }
            return setCon;
        }
        set;
    }
    // Initialize setCon and return a list of records
    public List<APEX_Job_Shweta__c> getOpportunities() {
        return (List<APEX_Job_Shweta__c>) setCon.getRecords();
        
        
    }


}