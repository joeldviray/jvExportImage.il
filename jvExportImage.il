;-------------------------------------------------------------------- 
; Open a window and export it. ; 
; If using IC613 ISR13 or later, you can use "none" in the call 
; to hiCreateWindow below. Otherwise change it to be "graphics" 
; (the difference is that the window will then appear briefly) 
;-------------------------------------------------------------------- ;
; Similar to thumbnail code... 
dd=ddGetObj( lib cell view "*") 
viewType=ddMapGetFileViewType(dd) 
; was none rather than graphics 
wid = hiCreateWindow( list(0:0 800:800) "none" "Export Window") 
wid->neverCurrentWindow = t 
deOpenCellView( lib cell view viewType wid "r") 

sprintf(imageFile "tbIMG_%s.png" testName) 
hiExportImage( 
	?fileName strcat(datasheetDir "/" imageFile) 
	?exportRegion 'entireDesign 
	?bgType 'transparent 
	?window wid 
) 

hiCloseWindow(wid) 

;- See more at: https://community.cadence.com/cadence_technology_forums/f/48/t/21784#sthash.Ikg2Osbu.dpuf
