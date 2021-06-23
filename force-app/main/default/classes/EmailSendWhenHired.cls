public class EmailSendWhenHired{
    @Future(callout=true)
    public static void sendToCandidate(List<Id> candidateIds){
     	List<Candidate_Shweta__c> lstCandidate = [SELECT id, Name, APEX_Email__c,APEX_FirstName__c, APEX_LastName__c, APEX_Status__c FROM Candidate_Shweta__c WHERE Id IN : candidateIds];
        Attachment attach = new Attachment();
        for(Candidate_Shweta__c objCandidate : lstCandidate)
        {
            PageReference pdf = Page.PDFCandidateDetailsVFPage;
            pdf.getParameters().put('id',objCandidate.id);
            System.debug('Printing pdf' +pdf);
            System.debug('Hello This is after pdf');
            System.debug('Status '+objCandidate.APEX_Status__c);
            
            
            //attach.Name = 'mycandidatedata.pdf'; // candidate fname+ lastname.pdf
            attach.Name = objCandidate.APEX_FirstName__c+ objCandidate.APEX_LastName__c + '.pdf';
            attach.IsPrivate=false; // why private -> The Private Checkbox indicates that the attachment is only accessible to the person who created or attached it and to administrators.
            attach.ParentId=objCandidate.id;// relaion
            attach.Body = pdf.getContentAsPDF();
            pdf.setRedirect(true);
            Blob b = pdf.getContent();
            try{
                Database.insert(attach);// save result??
            }
            catch(DmlException e)
            {
                System.debug('Ohhhh we an exception ' + e.getMessage());
            }
            // email send start here
            if(objCandidate.APEX_Status__c=='Hired')
            {
                System.debug('Hello you are hired');
                System.debug('email has been send to ' + objCandidate.APEX_Email__c);
                List<Messaging.Email> emailList = new List<Messaging.Email>();
                Messaging.SingleEmailMessage sendEmailToHired = new Messaging.SingleEmailMessage();
                Messaging.EmailFileAttachment pdfAttachment = new Messaging.EmailFileAttachment();
                pdfAttachment.setFileName(objCandidate.APEX_FirstName__c+ objCandidate.APEX_LastName__c + '.pdf');
                pdfAttachment.setBody(b);
                
                sendEmailToHired.setToAddresses(new String[]{objCandidate.APEX_Email__c});
                
                sendEmailToHired.setSubject('Congratulation You are Hired ');
                
                String body = 'Dear candidate you have been selected for this job';
                
                sendEmailToHired.setHtmlBody(body);
                sendEmailToHired.setFileAttachments(new Messaging.EmailFileAttachment[]{pdfAttachment});
                
                emailList.add(sendEmailToHired);
                
                Messaging.sendEmail(emailList);
                
            }
            else
            {
                System.debug('Hello Your are Fired');
            }// end
        }
    }
}