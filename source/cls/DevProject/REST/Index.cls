/// The REST interface: class that describes HTTP request routing
Class DevProject.REST.Index Extends %CSP.REST
{

XData UrlMap
{
<Routes>
   <Route Url="/" Method="GET" Call="Index"/>
</Routes>
}

/// Sample REST method
ClassMethod Index() As %Status
{
    write ##class(DevProject.Robot).Message(%request.Get("Name"))
    return $$$OK
}

}