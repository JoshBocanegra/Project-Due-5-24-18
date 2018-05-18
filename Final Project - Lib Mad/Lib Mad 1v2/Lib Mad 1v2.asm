; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
    include \masm32\include\masm32rt.inc
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

    .data
      BUFFER_SIZE = 40h  ;in decimal bytes = 64
             
      promptNoun         byte "Please enter a politcal faction",13,10,0                     ;,13,10,0 are ascii values    
      promptVerb         byte "Please enter a verb ending in -ing",13,10,0      ;13 returns the cairrage
      promptNumber       byte "Please enter a number",13,10,0                   ;10 is a newline
      promptName         byte "Please enter a name",13,10,0                     ;0 is a null terminator
      promptAdjective    byte "Please enter an Adjective",13,10,0               ;
      promptEmotion      byte "Please enter an emotion",13,10,0                 ;
      promptOnomonopia   byte "Please enter giberish",13,10,0                   ;
      
    .data?
      inputNoun          byte BUFFER_SIZE DUP (0)   ;if unitialized, StdOut will not work
      inputVerb          byte BUFFER_SIZE DUP (0)   ;initialize more strings to create longer stories
      inputNumber        byte BUFFER_SIZE DUP (0)   ;with multiple inputs of names and adjectives
      inputName          byte BUFFER_SIZE DUP (0)   ;for some really wacky fun
      inputAdjective     byte BUFFER_SIZE DUP (0)   
      inputEmotion        byte BUFFER_SIZE DUP (0)
      inputOnomonopia    byte BUFFER_SIZE DUP (0)

    .code

start:
;This is the main body of the code
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

    call mainInput  ;begins the subroutine that gathers the user input
    inkey
    call storyTime  ;begins the subroutine that dispalys the user input
    inkey
    exit
   
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

mainInput proc

    cls
    print "Welcome to LibMad",33,13,10
    print "A word game built on tears and bad taste. " 
    print "All Answers can be up to 64 characters long",33,13,10
    print "Press enter to input your response after each prompt.",13,10

 ;;;;The StdOut only needs the single parameter of the string address
 ;;;;The procedure will end when it reaches a null terminator (0)
 ;;;;The Stdin procedure needs two parameters to function
 ;;;;The First paramaeter is the string where the user entry will be sotored
 ;;;;The second paramter is the buffer size of the console input
    
    invoke StdOut,ADDR promptNoun               
    invoke StdIn,ADDR inputNoun, BUFFER_SIZE
    
    invoke StdOut,ADDR promptVerb
    invoke StdIn,ADDR inputVerb, BUFFER_SIZE
    
    invoke StdOut,ADDR promptNumber
    invoke StdIn,ADDR inputNumber, BUFFER_SIZE
    
    invoke StdOut,ADDR promptName
    invoke StdIn,ADDR inputName, BUFFER_SIZE
    
    invoke StdOut,ADDR promptAdjective
    invoke StdIn,ADDR inputAdjective, BUFFER_SIZE

    invoke StdOut,ADDR promptEmotion
    invoke StdIn,ADDR inputEmotion, BUFFER_SIZE

    invoke StdOut,ADDR promptOnomonopia
    invoke StdIn,ADDR inputOnomonopia, BUFFER_SIZE 
    
    ret

mainInput endp

; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

storyTime proc

    cls
    
    print "         There once was a man named "
    invoke StdOut,ADDR inputName
    print ". "
    invoke StdOut,ADDR inputName
    print " really enojoyed drinking beer and whiskey.",13,10
    print "On some nights, when "
    invoke StdOut,ADDR inputName
    print " was feeling very "
    invoke StdOut,ADDR inputEmotion
    print ", he would go out and "
    invoke StdOut,ADDR inputVerb
    print " with the local "
    invoke StdOut,ADDR inputNoun
    print ". What a wild guy! (And what a bunch of sots they are!)",13,10,9
   
    print "I wish there were "
    invoke StdOut,ADDR inputNumber
    print " of him!",13,10,"The world could always use more "
    invoke StdOut, ADDR inputName
    print "s!",13,10,"A guy like that really wants to make you say '"
    invoke StdOut, ADDR inputOnomonopia
    print "'! Whatever that means!",10,10,0
    
    ret

storyTime endp

end start
