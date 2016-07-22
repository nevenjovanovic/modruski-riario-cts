copy $c := db:open("modruskiriario","modr-n-oratio-riar-jovanovic-sententiae-verba.xml")
modify (
for $p in (
  "Saona",
"Patauium",
"Bononiam",
"Bosti",
"Ferariam",
"Imolae",
"Imolam",
"Italiae",
"Mediolani",
"Perusium",
"Romam",
"Senam",
"Senis",
"Ticinium",
"Venetias",
"Vicheriae"
)
for $places in $c//*:w[text() contains text { $p } ]
let $nplaces := replace($places/@n, 'w', 'locus')
return replace node $places with element placeName { attribute n { $nplaces } , $places/text() }
)
return $c