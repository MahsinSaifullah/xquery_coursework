<html>
    <body>
        <table border="1">
            <tr>
                <th>Target</th>
                <th>Successor</th>
            </tr>
        
            {
            for $w in collection("?select=*.xml")//w
            let $targetWord := normalize-space(lower-case($w)),
                $successorWord := normalize-space(lower-case($w/following-sibling::w[1]))
            where $targetWord = 'has'
            return
            <tr>
                <td> {$targetWord} </td>
                <td> {$successorWord} </td>
            </tr>
            }
        </table>
    </body>
</html>