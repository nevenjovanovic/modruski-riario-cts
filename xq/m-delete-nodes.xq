declare default element namespace "http://www.tei-c.org/ns/1.0";
for $t in //*:text/*:body/*:div/*:p/*:s[.="."]
return delete node $t