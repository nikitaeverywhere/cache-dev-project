/// <!-- @echo package.description --> <!-- @echo package.version -->
Class DevProject.Robot Extends %Persistent
{

Property Name As %String [ InitialExpression = { "Robot-"_$RANDOM(256)_"-"_$RANDOM(256)} ];

Property Energy As %Numeric(MAXVAL = 100, MINVAL = 0) [ InitialExpression = {$RANDOM(101)} ];

Method GetMessage() As %String
{
    return "I feel " _ $select(
    	..Energy > 95: "fully charged!",
    	..Energy > 85: "charged!",
    	..Energy > 50: "good.",
    	..Energy > 30: "a bit tired.",
    	..Energy > 15: "tired.",
    	..Energy > 5: "almost discharged.",
    	..Energy > 0: "the last seconds of my life!",
    	1: "dead."
    )
}

ClassMethod Spawn(number As %Numeric = 1) As %Status
{
    for i=1:1:number {
        set status = ##class(DevProject.Robot).%New().%Save()
    }
    return status
}

}