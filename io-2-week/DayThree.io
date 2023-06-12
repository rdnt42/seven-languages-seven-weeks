Builder := Object clone

#sender := call sender
    #spaces := if(sender type == "Object", "", "   ")
   # write(spaces)

Builder forward := method(
    if(call message name != "curlyBrackets", tagParse(call message))
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
tagParse := method(callMessage,
    write("<", callMessage name)
    if((callMessage arguments at(0) name) == "curlyBrackets", attrParse(callMessage arguments at(0)) print)
    writeln(">")
    #callMessage arguments println


    callMessage arguments foreach(arg,
        content := self doMessage(arg);
	    if(content type == "Sequence", write("   ");writeln(content))
	)
    writeln("</", callMessage name, ">")
)

Builder ul(
	book({"author": "Tate", "about": "aboutAttr"}, "Io"),
	li("Lua"), 
	li("JavaScript"))