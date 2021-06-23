@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    
global HttpResponse respond(HttpRequest request){
        HttpResponse response=new HttpResponse();
      	response.setHeader('contentType','application/json');
        response.setBody('{"animal":{"Id":1,"name":"moose","eats":"plants","Says":"bellows"}}');
        response.setStatusCode(200);
        return response;
}
}