<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
                <th>Probabilty</th>
            </tr>
        
            {
            let $targetWords := collection("?select=*.xml")//w[lower-case(normalize-space()) = "has"],
                $successorWords := $targetWords/lower-case(normalize-space(following-sibling::w[1])),
                $distinctWords := distinct-values($successorWords), 
                $probList :=
                     for $word at $i in $distinctWords 
                     let $numerator := count($successorWords[.=$word]),
                         $denominator := count(collection("?select=*.xml")//w[lower-case(normalize-space()) = $word]),
                         $prob := $numerator div $denominator
                     order by $prob descending
                     return $prob
                     
             for $probability at $i in subsequence($probList,1,20)
             return
                <tr>
                    <td> {$targetWords[1]} </td>
                    <td> {$distinctWords[$i]} </td>
                    <td> {$probability} </td>
                </tr>
            }
        </table>
    </body>
</html>