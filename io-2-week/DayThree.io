Builder := Object clone
Builder forward := method(
    sender := call sender
    spaces := if(sender type == "Object", "", "   ")
    write(spaces)
    writeln("<", call message name, ">")


    call message arguments foreach(arg,
        content := self doMessage(arg);
	    if(content type == "Sequence", write(spaces);write("   ");writeln(content))
	)
	write(spaces)
    writeln("</", call message name, ">")
)

Builder ul(
	li(li("Io")),
	li("Lua"), 
	li("JavaScript"))