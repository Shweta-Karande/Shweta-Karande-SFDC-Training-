public class EmailCandidatePDFHandler {
    
       public static void sendEmailToHiredCandidateDetailPDF(List<Candidate_Shweta__c> lstCandidate){
        for(Candidate_Shweta__c objCandidate:lstCandidate){
            if(objCandidate.APEX_Status__c=='Hired' && objCandidate.APEX_Email__c!=null){
              //  SendEmail.SentToCandidate(objCandidate.Id);
            }
        }
        
    }

}