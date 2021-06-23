trigger ContactTrigger on Contact (after update) {

    if(!BatchForNullPhoneUpdate.inBatchContext){
    System.debug('Value Trigger'+ContactTriggerHandlerContactUpdate.inFutureContext);    
    if (!ContactTriggerHandlerContactUpdate.inFutureContext) {
       
        if(Trigger.isAfter && Trigger.isUpdate){
            
            ContactTriggerHandlerContactUpdate.ContactUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    }
}