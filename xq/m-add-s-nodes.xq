declare default element namespace "http://www.tei-c.org/ns/1.0";
for $names in ("head", "p", "closer")
for $t in //*:text/*:body/*:div/*[name()=$names]
let $ss :=
for $s in tokenize(fn:normalize-space($t/text()), '\.')
return if ($s != "" ) then element s { $s || "." } else ()
return replace node $t with element { xs:QName($names) } { $ss }