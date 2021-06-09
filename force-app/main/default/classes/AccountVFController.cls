public class AccountVFController {
    public List<sObject> records{get;set;}

    public List<String> fields{get;set;}

    public AccountVFController(){

        records= [Select Name, Email, Phone FROM Contact WHERE AccountId = '0012w000004sAuy'];

        fields = new List<String>{'Name', 'Email', 'Phone'};

    }
}