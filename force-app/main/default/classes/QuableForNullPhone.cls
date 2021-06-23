public class QuableForNullPhone implements Queueable {
    public void execute(QueueableContext context) {
        try{
        Database.executeBatch(new BatchForNullPhoneUpdate(),50);
        }catch(Exception e){
            System.debug('Error Occure');
        }
    }

}