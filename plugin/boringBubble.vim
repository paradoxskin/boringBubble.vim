if exists("g:boringBubble#loaded")
	finish
endif
let g:boringBubble#loaded=1

if exists("g:boringBubble#len")==0
	let g:boringBubble#len=6
endif
if exists("g:boringBubble#echo")==0
	let g:boringBubble#echo=1
endif
if exists("g:boringBubble#map")==0
	let g:boringBubble#map="oo0O"
endif

function! GetBubble()
	return g:boringBubble#Bubble
endfunction

function! ChangeBubble()
	let s:rd=rand()%((1<<g:boringBubble#len*2)-1)
	let s:tmp=""
	let s:c=1
	while s:c<=g:boringBubble#len
		let s:tmp=s:tmp .. g:boringBubble#map[s:rd%4]
		let s:rd=s:rd>>2
		let s:c=s:c+1
	endwhile
	let g:boringBubble#Bubble = s:tmp
	if g:boringBubble#echo==1
		echo s:tmp
	endif
endfunction

call ChangeBubble()

au TextChanged,TextChangedI * call ChangeBubble()
