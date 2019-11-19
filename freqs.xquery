<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
                <th>Frequency</th>
            </tr>
        
            {
            let $targetWords := collection("?select=*.xml")//w[lower-case(normalize-space()) = "has"],
                $successorWords := $targetWords/lower-case(normalize-space(following-sibling::w[1]))
            for $distinctWord in distinct-values($successorWords) 
            let $freq := count($successorWords[.=$distinctWord])
            order by $freq descending
            return
            <tr>
                <td> {$targetWords[1]} </td>
                <td> {$distinctWord} </td>
                <td> {$freq} </td>
            </tr>
            }
        </table>
    </body>
</html>