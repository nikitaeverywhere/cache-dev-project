/// The REST interface: class that describes HTTP request routing
Class DevProject.REST.Index Extends %CSP.REST
{

XData UrlMap
{
<Routes>
   <Route Url="/" Method="GET" Call="Index"/>
   <Route Url="/Spawn" Method="GET" Call="Spawn"/>
</Routes>
}

/// Sample REST method
ClassMethod Index() As %Status
{
    set result = {}
    set resultSet = ##class(%ResultSet).%New("DevProject.Robot:Extent")
    do resultSet.Execute()
    while resultSet.Next() {
        set obj = ##class(DevProject.Robot).%OpenId(resultSet.Get("ID"))
        set $PROPERTY(result, obj.%Id()) = {
            "Name": obj.Name,
            "Energy": obj.Energy,
            "Message": obj.GetMessage()
        }
    }
    do resultSet.Close()
    write result.$toJSON()
    return $$$OK
}

ClassMethod Spawn() As %Status
{
    set status = ##class(DevProject.Robot).Spawn(%request.Get("number", 1))
    write { "status": status }.$toJSON()
    return status
}

}