<%@ Page Language="C#" %>
<@ import Namespace="GoogleWebService" >
//Remember,GoogleWebService is the namespace you named while creating the proxy!
<script runat="server">

    string key="licence key you got from google";
    /* I have declared the key string variable as global variable 
       since the key variable is to be passed every time you call the methods.
    */ 
    
    void Page_Load()
    {
        lblSpellSug.Text="";     
        //Label to display the Spelling Suggestion
        lblResultCount.Text="";  
        //Label to display the Estimated total result count
        lblSearchTime.Text="";   
        //Label to display the server time to return the search results, 
        //measured in seconds.
    }
    
    void btnSearch_Click(Object sender, EventArgs e) {
    //creating the instance of  the GoogleSearch class to invoke required methods
    GoogleSearchService obj=new GoogleSearchService();
    
    //spelling checking and suggesting if entered wrong
    string suggestion=obj.doSpellingSuggestion(key,Request.Form["txtPhrase"]);
    if (suggestion!=null)
        {
            lblSpellSug.Text="Suggestion: "+ suggestion;
        }
    
    //searching the phrase.....
    //Regarding the parameters refer to the Google API
    GoogleSearchResult res=obj.doGoogleSearch(key, Request.Form["txtPhrase"], 
                                              0, 10, false,"",false,"","","");
    lblResultCount.Text="Est. Total Result Count: " + 
                         Convert.ToString(res.estimatedTotalResultsCount); 
    //to display the total estimated result count
    lblSearchTime.Text= "Search Time: " + Convert.ToString(res.searchTime) + 
                        "sec";//search Time
    
    //displaying the results Returned by the Search in tabular using the Table control.
    ResultElement[] result=res.resultElements;
    foreach(ResultElement r in result)
        {
            ResultTable.CellSpacing=1;
            ResultTable.CellPadding=2;
    
            //formatting the Server control Table
            TableRowCollection trCol=ResultTable.Rows; 
            //ResultTable is the instance created for Table class
            //creating new Table Row and adding to the TableRowCollection
            TableRow tr=new TableRow();
            trCol.Add(tr);

            TableCellCollection tcCol=tr.Cells;
            //creating new Table Cell, assigning the title and the summary 
            //of the search result.
            TableCell tc=new TableCell();
            tc.Text="<a href="+ r.URL +">"+  r.title + "</a>" + "<BR>" +  r.summary;
            tcCol.Add(tc);
    
    
        }
    
    }
</script>