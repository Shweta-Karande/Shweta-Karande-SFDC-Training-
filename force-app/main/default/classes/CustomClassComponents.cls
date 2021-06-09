public class CustomClassComponents {

     public List<sObject> records{get;set;}

    public List<String> fields{get;set;}

    public CustomClassComponents(){

        records= [Select Name, Email, Phone FROM Contact WHERE AccountId = '0012w000004sAuy'];

        fields = new List<String>{'Name', 'Email', 'Phone'};

    }

 
  


}