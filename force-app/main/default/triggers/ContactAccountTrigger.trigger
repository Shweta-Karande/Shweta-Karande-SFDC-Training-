trigger ContactAccountTrigger on Contact (after insert,after update){
    List<Account> lstAccount=new list<Account>();
    List<Id> ids = new List<Id>();
    for(Contact objContact: trigger.new)
        ids.add(objContact.AccountId);
    Map<Id, Account> accountMap = new Map<Id, Account>([Select Id, Phone From Account Where Id In :ids]);
    for(Contact objContact: trigger.new)
    {
        Account objAccount = accountMap.get(objContact.AccountId);
        if(objAccount != null)
        {
            objAccount.Phone=objContact.MobilePhone;
            lstAccount.add(objAccount);
        }
    }
    update lstAccount;
}