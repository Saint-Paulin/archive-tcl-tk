# DVD-ROM qui tire la langue

package require Img
set img [image create photo -file dvd.jpg]

proc dvdl {} {
set imgl [image create photo -file dvdl.jpg]
.b configure -image $imgl
}

button .b -image $img -command dvdl
pack .b