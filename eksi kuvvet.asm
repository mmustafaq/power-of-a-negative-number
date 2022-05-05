org 100h
        
mov ax,-4d


mov ds:[0200h],3d ; base -1 (-1 is due to desired iteration)
                  ;while decrementing this value , 
;power -1 values
mov ds:[0210h],1d ; power 2
mov ds:[0220h],2d ; power 3
mov ds:[0230h],3d ; power 4

mov ds:[0240h],-4d ; increment value 

                                                                                  
;basically what square,third,square loops do is adding 4 to itself 4 times in inner loop       
;which is same as multiplying with 4 then adding that value to increment value   
;so every time first loop within the main loop finishes amount of increment value
;also increases so that we can yield power values without multiplying              

square:
    add ax,ds:[0240h]  ; add ax 4
    dec ds:[0200h],1d  ; decrement cx so we have a loop within a loop
                     
        jnz square   
    mov ds:[0240h],ax  ; in this part we are increasing increment value 
    
    mov ds:[0200h],3d  ;re-initalizing base value so loop will work according to algorhytim
    
dec ds:[0210h],1d      ;decreasing [0210h] value which in this case is 1 because we are in square loop.
jnz square

                       
mov bx,ds:[0240h]

                                ;moving the result to the bx register
not bx                          ;taking 2s complement of result
inc bx
sub bh,bh                       ;re-initialize values for other power functions
mov ax,-4d
mov ds:[0240h],-4d
                       ;other loops are based according to same algorhytim only difference is
                       ;outer loops circulate 2 and 3 times

third:
    add ax,ds:[0240h]
    dec ds:[0200h],1d   
            
        jnz third
    mov ds:[0240h],ax
    
    mov ds:[0200h],3d
    
dec ds:[0220h],1d
jnz third


mov cx,ds:[0240h]
sub ch,ch

mov ax,-4d
mov ds:[0240h],-4d

mov ax,-4d
mov [0240h],-4d

fourth:
    add al,[0240h]
    dec ds:[0200h],1d
        
        jnz fourth
    mov ds:[0240h],ax
    
    mov ds:[0200h],3d
    
dec ds:[0230h],1d
jnz fourth

mov dx,ds:[0240h]
not dx 
inc dx

















ret