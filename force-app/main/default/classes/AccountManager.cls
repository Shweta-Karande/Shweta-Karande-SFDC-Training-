@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request= RestContext.request;
        String accountId=request.requestURI.subStringBetween('Accounts/','/contacts');
        Account result=[SELECT ID, Name,(SELECT ID, FirstName, LastName FROM Contacts)
                                        FROM Account
                                        WHERE Id = :accountId];
        return result;
    }
}