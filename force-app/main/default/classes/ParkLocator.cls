public class ParkLocator {

    public static List <String> country(String country) {
       	ParksService.ParksImplPort prkSvc=new ParksService.ParksImplPort();
        return prkSvc.byCountry(country);
    }
}