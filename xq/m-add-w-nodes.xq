declare default element namespace "http://www.tei-c.org/ns/1.0";
for $names in ("head", "p", "closer")
for $t in //*:text/*:body/*:div/*[name()=$names]/*:s/text()
let $ss :=
for $s in ft:tokenize($t,map { 'case': 'sensitive' })
return element w { $s }
return replace node $t with $ss