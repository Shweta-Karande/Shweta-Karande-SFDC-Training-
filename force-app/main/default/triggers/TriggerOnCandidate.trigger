trigger TriggerOnCandidate on Candidate_Shweta__c (before insert,after insert, before update, after update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        CandidateTriggerHandler.expectedSalary(Trigger.new);
    }
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        CandidateTriggerHandler.jobNotActiveNotApply(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert)
    {
        //  System.debug(Trigger.new);
        CandidateTriggerHandler.applicationDate(Trigger.new);
    }
    
    /*    if(Trigger.isUpdate || Trigger.isInsert  )
{
CandidateTriggerHandler.sendEmailToHiredCandidateDetailPDF(Trigger.new);
}*/
    
    
}