public class JobTriggerHandler{
    public static void noOfPositionEqualHiredDeactive(List<APEX_Job_Shweta__c> lstApexJobShweta){
        
        for(APEX_Job_Shweta__c objJob:lstApexJobShweta){
            
            if(objJob.APEX_NoOfPosition__c==objJob.APEX_HiredApplicant__c ){
                objJob.APEX_Active__c=false;
            }else if(objJob.APEX_NoOfPosition__c>objJob.APEX_HiredApplicant__c){
                objJob.APEX_Active__c=true;
            }
        }
    }
    
    
    /*  public static void noOfPositionHigherThanHiredDeactive(List<APEX_Job_Shweta__c> newlist3){
for(APEX_Job_Shweta__c jobObj3:newlist3)
{
if(jobObj3.APEX_NoOfPosition__c>jobObj3.APEX_HiredApplicant__c) 
{
jobObj3.APEX_Active__c=true;
}
}
}*/
    public static void statusActiveCanNotDeleted(List<APEX_Job_Shweta__c>lstApexJobShweta){
        Job_Trigger_Handler__c jobTriggerBypass=Job_Trigger_Handler__c.getInstance(UserInfo.getUserId());
        boolean flag=jobTriggerBypass.checkedActive__c;
        System.debug('This is a flag='+flag);
        
        if(flag){
            for(APEX_Job_Shweta__c objJob:lstApexJobShweta)
            {
                if(objJob.APEX_Active__c)
                    objJob.addError('This Job is active and can not be deleted');
            }
        }
        /*   for(APEX_Job_Shweta__c jobObj:lstApexJobShweta)
{
if(jobObj.APEX_Active__c==true)
jobObj.addError('This Job is active and can not be deleted');
}*/
    }
    
    public static void sendEmail(List<APEX_Job_Shweta__c> listJob)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Set <Id> setContactIds= new Set<Id>();
        for(APEX_Job_Shweta__c objJob:listJob)
        {
            if(objJob.APEX_NoOfPosition__c==objJob.APEX_HiredApplicant__c ){
                setContactIds.add(objJob.APEX_Manager__c);
            }
        }
        List<String> listManagerEmail=new List<String>();
        if(setContactIds.size()>0)
        {
            List<Contact> listContact=[SELECT Email FROM Contact WHERE Email!=null AND id IN:setContactIds];
            for(Contact contactObj:listContact)
            {
                listManagerEmail.add(contactObj.Email);
            }
            mail.setToAddresses(listManagerEmail);
            mail.setSubject('Vacancy Full....');
            for(APEX_Job_Shweta__c objJob:listJob)
            {	
                mail.setPlainTextBody('All required candidate has been hired for this job on'+objJob.LastModifiedDate);
                mails.add(mail);
            }
            if (!mails.isEmpty()){
                Messaging.sendEmail(mails);
            }
        }
    }
}