trigger CandidateTriggerPDF on Candidate_Shweta__c (after insert , after update ) {
    
  	if(Trigger.isUpdate || Trigger.isInsert  )
    {
      EmailCandidatePDFHandler.sendEmailToHiredCandidateDetailPDF(Trigger.new);
      //	PracticeClass.SentToCandidate();
    }
    

}