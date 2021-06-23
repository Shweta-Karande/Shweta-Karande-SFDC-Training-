public class InActiveJobSchedular implements Schedulable{
    public void execute(SchedulableContext sc){
        Database.executeBatch(new BatchToScheduleExpireOnJob(),20);
    }

}