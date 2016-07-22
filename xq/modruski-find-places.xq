let $places := for $p in //*:text//*:placeName
order by $p
let $pp := normalize-space(string-join($p//text(), ''))
return $pp
return distinct-values($places)