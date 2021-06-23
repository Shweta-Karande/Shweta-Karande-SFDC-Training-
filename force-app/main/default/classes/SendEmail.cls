public class SendEmail{
     @future(Callout=true)
    public static void SentToCandidate(List<Id>candidateId){
        Attachment attach=new Attachment();
        Messaging.SingleEmailMessage sendmail = new Messaging.SingleEmailMessage();
    List<Candidate_Shweta__c> lst=new List<Candidate_Shweta__c>([SELECT Id, APEX_Email__c FROM Candidate_Shweta__c WHERE Id IN:candidateId]);
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        List<Messaging.EmailFileAttachment> fileAttachments=new List<Messaging.EmailFileAttachment>();
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>();
        for(Candidate_Shweta__c candidate:lst){
            PageReference pdf = Page.PDFCandidateDetailsVFPage;
            pdf.getParameters().put('id', candidate.Id);
            Blob attbody;
            pdf.setRedirect(false);
            attbody=pdf.getContentAsPDF();
           	attach.Body=attbody;
            efa.setFileName('CandidateDetails.pdf');
            efa.setBody(attbody);
            attach.Name=efa.filename;
            attach.IsPrivate=false;
            attach.ParentId=candidate.Id;
            sendmail.toaddresses=new String[]{candidate.APEX_Email__c};
                fileAttachments.add(efa);
            	String htmlbody ='Heee Congratulation';
            	sendmail.subject='You are selected';
            	sendmail.setHtmlBody(htmlbody);
            	sendmail.plaintextbody='Regarding Offer Letter';
            	sendmail.setFileAttachments(fileAttachments);
                messages=new List<Messaging.SingleEmailMessage>{sendmail};
              }
        insert attach;
     }
    
}
    
    
  /*  @future(Callout=true)
    public static void SentToCandidate(){
        Attachment attachment= new Attachment();
         
        PageReference pdf = Page.PDFCandidateDetailsVFPage;
        pdf.getParameters().put('id', 'a005g00002wLXLM');
         
        attachment.Name='Candidate.pdf';
        attachment.IsPrivate=false;
        
        attachment.ParentId='a005g00002wLXLM';
        attachment.Body=pdf.getContentAsPDF();
        
        Database.insert(attachment);
    }
}*/
    
 
    
    
    
  /*   public static  void SendToCandidate(List<Candidate_Shweta__c> listOfcandidate)
    {
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        
       if(listOfcandidate[0].APEX_Status__c=='Hired')
       {
           System.debug('email has been send to ' + listOfcandidate[0].APEX_Email__c);
           
           Messaging.SingleEmailMessage sendEmailToHired = new Messaging.SingleEmailMessage();
           
           sendEmailToHired.setToAddresses(new String[] {listOfcandidate[0].APEX_Email__c});
           
           sendEmailToHired.setSubject('Congratulation You are Hired for candidatePDF Details ');
           
           String body = 'Dear candidate you have been selected for this job';
           
           sendEmailToHired.setHtmlBody(body);
           
           emailList.add(sendEmailToHired);
           
           Messaging.sendEmail(emailList);
           
       }
       else
        {
            System.debug('Hello Your are Fired');
        }
    }*/