trigger TriggerOnCandidateNewPDF on Candidate_Shweta__c (before insert, before update) {
    
    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert )) { 
        List <Id> lstId= new List<Id>();
        for(Candidate_Shweta__c objCandidate : Trigger.new) {
            if(objCandidate.APEX_Status__c=='Hired'){
                lstId.add(objCandidate.id);
            }
            System.debug('Obejct Value ' + objCandidate);
        }
        EmailSendWhenHired.sendToCandidate(lstId);
        //  System.debug('Obejct Id ' + id);
    }
    
    /*
*  for(Candidate_Shweta__c obj : Trigger.new){


}*/
}