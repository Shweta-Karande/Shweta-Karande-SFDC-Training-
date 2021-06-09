public class CandidateTriggerHandler {
    static dateTime tempAppDate{get;set;}
    public static void expectedSalary(List<Candidate_Shweta__c> lstCandidates){
        for(Candidate_Shweta__c candidateObj:lstCandidates)
        {
            if(candidateObj.APEX_ExpectedSalary__c==null || candidateObj.APEX_ExpectedSalary__c<=0){
                candidateObj.addError('Expected Salary field is missing');
            }
        }
    }
    
    public static void jobNotActiveNotApply(List<Candidate_Shweta__c> listCandidate)
    {
        Set<Id> jobId= new Set<Id>();
        
        for(Candidate_Shweta__c candidateObj : listCandidate)
        {
            if(candidateObj.APEX_JOB_Shwetajob__c!=null)
            {
                jobId.add(candidateObj.APEX_JOB_Shwetajob__c);
            }
        }
        
        Map<Id,APEX_Job_Shweta__c>  notActiveJob = new Map<Id,APEX_Job_Shweta__c>([SELECT Id,APEX_Active__c from APEX_Job_Shweta__c where Id In:
                                                                                   jobid AND APEX_Active__c=false]);
        
        for(Candidate_Shweta__c objCandidate:listCandidate)
        {
            if(notActiveJob.get(objCandidate.APEX_JOB_Shwetajob__c)!=null){
                objCandidate.addError('This job is not active. You can not apply for this job');
            }   
        }
    }
    
    
    
    public static void applicationDate(List<Candidate_Shweta__c> candidateList)  {
        List<Candidate_Shweta__c> candidateUpdateList=new List<Candidate_Shweta__c>();
        
        System.debug(candidateList);
        for(Candidate_Shweta__c candidateObj:candidateList)
        {
            Candidate_Shweta__c candObj1=new Candidate_Shweta__c();
            candObj1.Id=candidateObj.id;
            candObj1.APEX_ApplicationDate__c=candidateObj.CreatedDate.Date();
            candidateUpdateList.add(candObj1);
            
            //candidateObj.APEX_ApplicationDate__c= ? null :tempAppDate.date();
            // obj2.Date__c = (obj1.CreatedDate == null) ? null : obj1.CreatedDate.date();
        }
        Update candidateUpdateList;
        
        
    }
    
    
}