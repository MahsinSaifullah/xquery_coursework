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
                $successorWords := $targetWords/lower-case(normalize-space(following-sibling::w[1]))
            for $distinctWord in distinct-values($successorWords) 
            let $numerator := count($successorWords[.=$distinctWord]),
                $denominator := count(collection("?select=*.xml")//w[lower-case(normalize-space()) = $distinctWord]),
                $prob := $numerator div $denominator
            order by $prob descending
            return
            <tr>
                <td> {$targetWords[1]} </td>
                <td> {$distinctWord} </td>
                <td> {$prob} </td>
            </tr>
            }
        </table>
    </body>
</html>