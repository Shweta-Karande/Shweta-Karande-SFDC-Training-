trigger TriggerOnJob on APEX_Job_Shweta__c (before insert,before delete,before update,after update,after insert) {
    
    if(Trigger.isBefore  &&  Trigger.isDelete){
        JobTriggerHandler.statusActiveCanNotDeleted(Trigger.old);
    }
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        JobTriggerHandler.noOfPositionEqualHiredDeactive(Trigger.New);
    }
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        JobTriggerHandler.sendEmail(Trigger.New);  
    }
}