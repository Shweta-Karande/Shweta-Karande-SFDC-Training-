trigger TriggerOnStudent on Student__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
   
/*  if(Trigger.isBefore && Trigger.isInsert)
    {
        System.debug('isBefore && isInsert TNew'+Trigger.new);
          System.debug('isBefore && isInsert Told'+Trigger.old);
          System.debug('isBefore && isInsert TNewMap'+Trigger.newMap);
          System.debug('isBefore && isInsert ToldMap'+Trigger.oldMap);
    }*/
    
  if(Trigger.isBefore && Trigger.isUpdate)
    {
       System.debug('isBefore && isUpdate TNew'+Trigger.new);
          System.debug('isBefore && isUpdate Told'+Trigger.old);
         System.debug('isBefore && isUpdate TNewMap'+Trigger.newMap);
          System.debug('isBefore && isUpdate ToldMap'+Trigger.oldMap);
    }
    
      
   /*   if(Trigger.isBefore && Trigger.isDelete)
    {
       System.debug('isBefore && isDelete TNew'+Trigger.new);
          System.debug('isBefore && isDelete Told'+Trigger.old);
         System.debug('isBefore && isDelete TNewMap'+Trigger.newMap);
          System.debug('isBefore && isDelete ToldMap'+Trigger.oldMap);
    }*/
    
  /*    if(Trigger.isAfter && Trigger.isInsert)
    {
        System.debug('isAfter && isInsert TNew'+Trigger.new);
         System.debug('isAfter && isInsert Told'+Trigger.old);
          System.debug('isAfter && isInsert TNewMap'+Trigger.newMap);
        System.debug('isAfter && isInsert ToldMap'+Trigger.oldMap);
    }*/
   
   /*   if(Trigger.isAfter && Trigger.isUpdate)
    {
        System.debug('isAfter && isUpdate TNew'+Trigger.new);
          System.debug('isAfter && isUpdate Told'+Trigger.old);
         System.debug('isAfter && isUpdate TNewMap'+Trigger.newMap);
          System.debug('isAfter && isUpdate ToldMap'+Trigger.oldMap);
    }*/

     /*  if(Trigger.isAfter && Trigger.isDelete)
    {
        System.debug('isAfter && isDelete TNew'+Trigger.new);
          System.debug('isAfter && isDelete Told'+Trigger.old);
         System.debug('isAfter && isDelete TNewMap'+Trigger.newMap);
          System.debug('isAfter && isDelete ToldMap'+Trigger.oldMap);
    }*/
   /*   if(Trigger.isAfter && Trigger.isUndelete)
    {
       System.debug('isAfter && isUndelete TNew'+Trigger.new);
          System.debug('isAfter && isUndelete Told'+Trigger.old);
          System.debug('isAfter && isUndelete TNewMap'+Trigger.newMap);
         System.debug('isAfter && isUndelete ToldMap'+Trigger.oldMap);
    }*/
}