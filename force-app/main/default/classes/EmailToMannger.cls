public class EmailToMannger {
    public static void sendMail(List<APEX_Job_Shweta__c> Job_lst) {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
        for(APEX_Job_Shweta__c job_obj:Job_lst) {
            if(job_obj.APEX_NoOfPosition__c==job_obj.APEX_HiredApplicant__c) {
                sendTo.add(job_obj.APEX_Manager__c);
                mail.setToAddresses(sendTo);
                mail.setSubject('Vacancy full');
                String body = 'All required candidate has been hired for this job on' +job_obj.LastModifiedDate ;
                mail.setHtmlBody(body);
                mails.add(mail);
            }
           
        }
        Messaging.sendEmail(mails);
    }
    
    

}