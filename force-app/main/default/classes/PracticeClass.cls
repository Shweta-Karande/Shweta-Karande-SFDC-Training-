public class PracticeClass {

    @future(Callout=true)
    public static void SentToCandidate(){
        Attachment attachment= new Attachment();
         
        PageReference pdf = Page.PDFCandidateDetailsVFPage;
        pdf.getParameters().put('id', 'a005g00002wLXLM');
         
        attachment.Name='Candidate.pdf';
        attachment.IsPrivate=false;
        
        attachment.ParentId='a005g00002wLXLM';
        attachment.Body=pdf.getContentAsPDF();
        
        Database.insert(attachment);
    }

    
}