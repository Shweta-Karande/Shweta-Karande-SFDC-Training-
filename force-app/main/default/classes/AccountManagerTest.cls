@isTest
private class AccountManagerTest {
	@isTest
    static void testGetAccount(){
        Account a=new Account(Name='TestAccount');
        insert a;
        Contact c=new Contact(AccountId=a.Id, FirstName='Test', LastName='Test', Email='shwetabkarande04@gmail.com');
        insert c;
        
        RestRequest request=new RestRequest();
        request.requestURI='https://https://enzigmasoftwarepvtltd-4e-dev-ed.my.salesforce.com/Services/apexrest//Accounts/'+a.Id+'/contacts';
        request.httpMethod='GET';
        RestContext.request=request;
        
        Account myAcc=AccountManager.getAccount();
        System.assert(myAcc !=null);
        System.assertEquals('TestAccount', myAcc.Name);
    }
    
}