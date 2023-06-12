Builder := Object clone

Builder forward := method(
    sender := call sender
    spaces := if(sender type == "Object", "", "   ")
    if(call message name != "curlyBrackets",
        tagParse(call message, spaces)
    )
)

attrParse := method(callMessage,
    sb := Sequence clone
    callMessage arguments foreach(arg,
        sb appendSeq(" ")
        keyValArr := arg asString split(":")
        # need RegEx
        keySrc := keyValArr at(0)
        valSrc := keyValArr at(1)

        sb appendSeq(keySrc exSlice (1, keySrc size - 2))
        sb appendSeq("=\"")
        sb appendSeq(valSrc exSlice (2, valSrc size - 1))
        sb appendSeq("\",")

    )
    sb removeLast()

    return sb
)
tagParse := method(callMessage, spaces,
    write(spaces);write("<", callMessage name)
    if((callMessage arguments at(0) name) == "curlyBrackets", attrParse(callMessage arguments at(0)) print)
    writeln(">")

    callMessage arguments foreach(arg,
        content := self doMessage(arg);
	    if(content type == "Sequence", write(spaces);write("   ");writeln(content))
	)
    write(spaces);writeln("</", callMessage name, ">")
)

Builder ul(
	book({"author": "Tate", "about": "aboutAttr"}, "Io"),
	li("Lua"), 
	li("JavaScript"))