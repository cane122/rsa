.data
17 // prost broj 1
19 // prost broj 2
3 // broj e (encrypt)
/*

.text
/*
Spisak registara:
R0 - privremeni registar.
R1 - pb1
R2 - pb2
R3 – First part of public key
R4 - other part of public key
R5 - broj e
*/
begin:
//ucitaj REGISTRE
ld R1, R0
inc R0,R0
ld R2, R0

//kljuc1 = pb1 * pb2
mnozenje:
add R3, R1, R3
dec R2, R2
jmpnz mnozenje

//kljuc2 = (pb1 - 1) * (pb2 - 1)
sub R0, R0, R0
ld R2, R0
dec R1, R1
dec R2, R2
mnozenje:
add R4, R1, R4
dec R2, R2
jmpnz mnozenje

// e<phi
while1:
sub R0, R5, R4
jmpns kraj
/// slobodni su R6, R7




sub R6, R5, R4
jmpz endd
jmps exchg

l2:
mov R7, 0

again :
 .code  
      mov      ax,@data          ; initialize DS  
      mov      ds, ax       
      mov      ax, no1           ; get the first number  
      mov      bx, no2           ; get the second number  
 again:      cmp      ax, bx     ; check if nos are equal  
          je      endd           ; if equal, save the GCD  
      jb      exchg              ; if no,   
                                 ; is AX                                 ; if yes interchange   
 l2:     mov      dx, 0  
      div      bx                ; check if ax is   
                                 ; divisible by bx  
      cmp      dx, 0     ;  
      je      endd  
      mov      ax, dx            ; mov the remainder   
                                 ; as no1 data  
      jmp      again  
 exchg :      xchg      ax, bx jmp l2  
 endd :      mov      gcd, bx  
      mov      ch, 04h           ; Count of digits to be   
                ; displayed  
      mov      cl, 04h           ; Count to roll by 4 bits  
 l12:     rol      bx, cl        ; roll bl so that msb   
                ; comes to lsb   
         mov      dl, bl         ; load dl with data   
                ; to be displayed  
         and      dl, 0fH        ; get only lsb  
         cmp      dl, 09         ; check if digit is 0-9   
                ; or letter A-F  
         jbe      l4  
         add      dl, 07         ; if letter add 37H else   
                ; only add 30H  
 l4:       add      dl, 30H  
         mov      ah, 02         ; INT 21H   
                ; (Display character)  
         int      21H  
         dec      ch             ; Decrement Count  
         jnz      l12                                
      mov      ah, 4ch  
      int      21h  
 end


jmp while1
kraj:
/*
  while (e < phi) {
        // e must be co-prime to phi and
        // smaller than phi.
        if (gcd(e, phi) == 1)
            break;
        else
            e++;
    }
*/