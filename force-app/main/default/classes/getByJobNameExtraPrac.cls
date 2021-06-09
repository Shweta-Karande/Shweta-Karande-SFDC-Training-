public class getByJobNameExtraPrac{
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT APEX_Name__c,(SELECT id, APEX_Email__c, APEX_FullName__c from Candidate_Shwetas__r)
             from APEX_Job_Shweta__c where id ='a015g00000LWrdF']));
            }
            return setCon;
        }
        set;
    }
    // Initialize setCon and return a list of records
    public List<APEX_Job_Shweta__c> getOpportunities() {
        return (List< APEX_Job_Shweta__c>) setCon.getRecords();
    }
}