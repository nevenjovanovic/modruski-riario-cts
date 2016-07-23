declare namespace functx = "http://www.functx.com";
declare function functx:substring-before-last
  ( $arg ,
    $delim ) {

   if (matches($arg, $delim))
   then replace($arg,
            concat('^(.*)', $delim,'.*'),
            '$1')
   else ''
 } ;
declare function functx:substring-after-last
  ( $arg ,
    $delim ) {

   replace ($arg,concat('^.*',$delim),'')
 } ;
let $cts := collection("modruskicitconfig")//*:online
let $test := (
  "urn:cts:croala:modr-n.oratio-riar.croala-loci:p10.s2.locus10",
  "urn:cts:croala:modr-n.oratio-riar.croala-loci:p3.s17.locus11",
"urn:cts:croala:modr-n.oratio-riar.croala-loci:p3.s10.locus16",
"urn:cts:croala:modr-n.oratio-riar.croala-loci:p3.s10.locus18",
"urn:cts:croala:modr-n.oratio-riar.croala-loci:p3.s10.locus20" 
)
for $t in $test
let $urn := functx:substring-before-last($t, ":") || ":"
let $xpath := functx:substring-after-last($t, ":")
let $xpathphr := "//*[@n='" || replace($xpath, "\.", "']/*[@n='") || "']"
let $xpathphr2 := functx:substring-before-last($xpathphr, "/")
let $passage := xquery:eval($xpathphr2, map { '': db:open('modruskiriario', data($cts[@urn=$urn]/@docname)) })
return element s { 
$passage/@n , 
attribute urn {$t} ,
normalize-space(data($passage)) }