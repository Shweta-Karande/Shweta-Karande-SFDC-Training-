global with sharing class allJobs {
    public id jobId{get;set;}
    public APEX_Job_Shweta__c objJob1{get;set;}
    public Candidate_Shweta__c candidate1{get;set;}
    public APEX_Job_Shweta__c jobObj{get;set;}
    
    public List<Candidate_Shweta__c> records{get;set;}
    
    public List<String> fields{get;set;}
    Public Boolean ShowCandidateListFlag{get;set;}
    Public List<Candidate_Shweta__c> accRec{get;set;}
    
    public allJobs(){
          candidate1 = new  Candidate_Shweta__c();
         jobId= ApexPages.CurrentPage().getParameters().get('id');
        accRec = [select name,id, APEX_FullName__c, APEX_ApplicationDate__c, APEX_State__c,APEX_Email__c,APEX_JOB_Shwetajob__c,Country__c,APEX_ExpectedSalary__c FROM Candidate_Shweta__c limit 5];
        ShowCandidateListFlag = false;
        if(jobId!=null){
         jobObj=[SELECT APEX_Name__c, APEX_NoOfPosition__c,APEX_JobPositins__c,APEX_Manager__c FROM APEX_Job_Shweta__c WHERE id=:jobId];
        
        records= [Select APEX_Salutation__c,APEX_FirstName__c,APEX_LastName__c,APEX_FullName__c,APEX_DateOFBirth__c,APEX_ApplicationDate__c,APEX_Email__c,Country__c,APEX_State__c,APEX_ExpectedSalary__c,APEX_JOB_Shwetajob__c FROM Candidate_Shweta__c WHERE APEX_JOB_Shwetajob__c=:jobId];
        
        /* fields = new List<String>{'APEX_Salutation__c', 'APEX_FirstName__c','APEX_LastName__c','APEX_FullName__c','APEX_DateOFBirth__c','APEX_ApplicationDate__c','APEX_Email__c','Country__c','APEX_State__c','APEX_ExpectedSalary__c','APEX_JOB_Shwetajob__c'};*/
        fields = new List<String>{'APEX_FullName__c','APEX_Email__c','id'};
            }
            }
    @RemoteAction
    global static list<APEX_Job_Shweta__c> increaseNoOfPosition(String jobId){
        System.debug('In REMOTE Action Method'+jobid);
       list<APEX_Job_Shweta__c> appliedJob=[SELECT APEX_NoOfPosition__c FROM APEX_Job_Shweta__c WHERE id=:jobId];
        
        System.debug('increase hhsbsxbj='+appliedJob);
        for(APEX_Job_Shweta__c objJob:appliedJob){
           objJob.APEX_NoOfPosition__c=objJob.APEX_NoOfPosition__c+1; 
        }
        Database.SaveResult[] result=Database.update(appliedJob, false);
        return appliedJob;
    }
  
    
    public void Save()
    {
        insert  candidate1;
        candidate1=new Candidate_Shweta__c();
        
    }
    
    
    Public void ShowCandidateMethod(){
        ShowCandidateListFlag = true;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
    
    
}