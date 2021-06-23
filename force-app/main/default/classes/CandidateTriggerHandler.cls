public class CandidateTriggerHandler {
    //static dateTime tempAppDate{get;set;}
    public static void expectedSalary(List<Candidate_Shweta__c> lstCandidates){
        for(Candidate_Shweta__c objCandidate:lstCandidates)
        {
            if(objCandidate.APEX_ExpectedSalary__c==null || objCandidate.APEX_ExpectedSalary__c<=0){
                objCandidate.addError('Expected Salary field is missing');
        }
        }
    }
    
    public static void jobNotActiveNotApply(List<Candidate_Shweta__c> lstCandidates)
    {
        Set<Id> jobIds= new Set<Id>();
        for(Candidate_Shweta__c objCandidate : lstCandidates)
        {
          jobIds.add(objCandidate.APEX_JOB_Shwetajob__c);
        }
         Map<Id,APEX_Job_Shweta__c>  notActiveJob = new Map<Id,APEX_Job_Shweta__c>([SELECT Id,APEX_Active__c 
                                                                                   FROM APEX_Job_Shweta__c
                                                                                   WHERE Id IN: jobIds AND APEX_Active__c=false]);
         for(Candidate_Shweta__c objCandidate:lstCandidates){
            if(notActiveJob.get(objCandidate.APEX_JOB_Shwetajob__c)!=null)
            {
                objCandidate.addError('This job is not active. You can not apply for this job');
            }   
        }
    }
    
    
    
    public static void applicationDate(List<Candidate_Shweta__c> lstCandidate)  {
        List<Candidate_Shweta__c> lstCandidateUpdated=new List<Candidate_Shweta__c>();
        
        System.debug(lstCandidate);
        
        for(Candidate_Shweta__c objCandidate:lstCandidate)
        {
            Candidate_Shweta__c objCand=new Candidate_Shweta__c();
            objCand.Id=objCandidate.id;
            objCand.APEX_ApplicationDate__c=objCandidate.CreatedDate.Date();
            lstCandidateUpdated.add(objCand);
            
            //objCandidate.APEX_ApplicationDate__c= ? null :tempAppDate.date();
            // obj2.Date__c = (obj1.CreatedDate == null) ? null : obj1.CreatedDate.date();
        }
        if (!lstCandidateUpdated.isEmpty() ){
        Update lstCandidateUpdated;
        }
        
        
    }
    
 
    
    
}