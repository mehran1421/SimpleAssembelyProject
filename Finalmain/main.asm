
start:
ldi r20,4
ldi r21,13
ldi r22,8
call MainFunction

MainFunction:
    cpi r20,8
	brcc maineight
	cpi r20,7
	brcc mainseven
	cpi r20,6
	brcc mainsix
	cpi r20,5
	brcc mainfive
	cpi r20,4
	brcc mainfour
	cpi r20,3
	brcc mainthree
	cpi r20,2
	brcc maintwo
	cpi r20,1
	brcc mainone
	cpi r20,0
	brcc mainzero

	mainzero:
		jmp zero
	mainone:
		jmp one
	maintwo:
		jmp two
	mainthree:
		jmp three
	mainfour:
		jmp four2
	mainfive:
		jmp five2
	mainsix:
		jmp six2
	mainseven:
	    jmp seven
	maineight:
	    jmp eight

	zero:
		clr r16				;r16=0
		clr r17				;r17=0
		cp r21,r22			;if(r21>=r22) C=0 else C=1
		brcs small21		;if(C==1) goto else
		mov r16,r21			;r16=r21
		mov r17,r22			;r17=r22
		jmp end				;end
		small21:
			mov r16, r22	;r16=r22
			mov r17, r21	;r17=r21
			jmp end			;end
;=================================================
	one:
		clr r24				;r24=0
		clr r23				;r23=0
		clr r16				;r16=0
		mov r23,r22			;r23=r22
		mov r24,r21			;r24=r21
		dec r23				;r23--
		loop:
			add r21,r24		;r21=r21+r24
			dec r23			;r23--
			brne loop		;goto loop
			mov r16,r21		;r16=r21
			jmp end			;end
;=================================================
	two:
		clr r16				;r16=0
		clr r17				;r17=0
		clr r23				;r23=0
		cp r21,r22			;if(r21>=r22) C=0 else C=1
		brcc big21			;if(C==0) goto big21 else goto big22
	big22:				
						;for swap r21 and r22:)
		mov r23,r21		;r23=r21
		mov r21,r22		;r21=r22
		mov r22,r23		;r22=r23
		jmp big21		;goto big21
	big21:
		sub r21,r22		;r21=r21-r22
		mov r17,r21		;r17=r21
		inc r16			;r16++
		cp r21,r22		;if(r21>=r22) C=0 else C=1
		brcc big21		;if(C==0) goto big21
		jmp end			;end
;====================================================
	three:
		clr r16				;r16=0
		clr r17				;r17=0
		clr r23				;r23=0
		cp r21,r22			;if(r21>=r22) C=0 else C=1
		brcc bigis21			;if(C==0) goto big21 else goto big22
		bigis22:				
							;for swap r21 and r22:)
			mov r23,r21		;r23=r21
			mov r21,r22		;r21=r22
			mov r22,r23		;r22=r23
			jmp bigis21		;goto big21
		bigis21:
			cp r21,r22		;if(r21>=r22) C=0 else C=1
			mov r17,r21     ;r17=r21
			brcs load		;if(C==1) goto load
			sub r21,r22		;r21=r21-r22
			inc r16			;r16++
			jmp bigis21		;goto big 21 
		load:
			cpi r17,1		;if(r17>=1) C=0 else C=1
			brcc load2		;if(C==0) goto load2
			ldi r16,1		;r16=1
			jmp end			;end
		load2:
			ldi r16,0		;ldi=0
			jmp end			;end

	four2:
			ldi r31,2			;r31=2
			clr r16				;r16=0
		clr r17				;r17=0
		clr r30				;r30=0
		mov r22,r21			;r22=r21
		ldi r30,0
		divation:
			cp r21,r31		;if(r21>=r31) C=0 else C=1
			mov r17,r21		;r17=r21
			brcs prime		;if(C==1) goto prime
			sub r21,r31		;r21=r21-r31
			inc r16			;r16++
			jmp divation    ;goto divation

		prime:
			cp r30,r17		;if(1>=r17) C=0 else C=1
			brcc portable	;if(C==0) goto portable
			mov r21,r22		;r21=r22
			clr r16			;r16=0
			clr r17			;r17=0
			inc r31			;r31++
			cp r31,r21		;if(r31>=r21) C=0 else C=1
			brcs divation   ;if(C==0) goto else
			jmp primeNumber
		portable:
			ldi r16,0		;r16=0
			jmp end			;end
		primeNumber:
			ldi r16,1		;r16=1
			jmp end			;end

;====================================================
five2:
		ldi r31,2			;r31=2
		clr r16				;r16=0
		clr r17				;r17=0
		clr r30				;r30=0
		ldi r30,0
		cp r21,r22
		brcc big5r21
			
		big5r21:
							;for swap r21 and r22:)
			mov r23,r21		;r23=r21
			mov r21,r22		;r21=r22
			mov r22,r23		;r22=r23
			jmp big5r22		;goto big21

		big5r22:
			mov r23,r21
			divation5:
				cp r21,r31		;if(r21>=r31) C=0 else C=1
				mov r17,r21		;r17=r21
				brcs prime5		;if(C==1) goto prime
				sub r21,r31		;r21=r21-r31
				inc r16			;r16++
				jmp divation5    ;goto divation
			prime5:
				cp r30,r17		;if(1>=r17) C=0 else C=1
				brcc portable5	;if(C==0) goto portable
				mov r21,r23		;r21=r22
				clr r16			;r16=0
				clr r17			;r17=0
				inc r31			;r31++
				cp r31,r21		;if(r31>=r21) C=0 else C=1
				brcs divation5   ;if(C==0) goto else
				jmp primeNumber5
			portable5:
				inc r23
				mov r21,r23
				clr r16
				clr r17
				ldi r31,2
				jmp divation5
			primeNumber5:
				mov r16,r23
				jmp end
;=====================================================================
six2:
	ldi r31,2			;r31=2
	clr r16				;r16=0
	clr r17				;r17=0
	clr r30				;r30=0
	ldi r30,0
	cp r21,r22
	brcc big6r21	
	big6r22:
		mov r23,r21		;r23=r21
		mov r21,r22		;r21=r22
		mov r22,r23		;r22=r23
		jmp big6r21		;goto big21
	big6r21:
		mov r23,r21
		divation6:
			cp r21,r31		;if(r21>=r31) C=0 else C=1
			mov r17,r21		;r17=r21
			brcs prime6		;if(C==1) goto prime
			sub r21,r31		;r21=r21-r31
			inc r16			;r16++
			jmp divation6   ;goto divation
		prime6:
			cp r30,r17		;if(1>=r17) C=0 else C=1
			brcc portable6	;if(C==0) goto portable
			mov r21,r23		;r21=r22
			clr r16			;r16=0
			clr r17			;r17=0
			inc r31			;r31++
			cp r31,r21		;if(r31>=r21) C=0 else C=1
			brcs divation6   ;if(C==0) goto else
			jmp primeNumber6
		portable6:
			dec r23
			mov r21,r23
			clr r16
			clr r17
			ldi r31,2
			jmp divation6
		primeNumber6:
			mov r16,r23
			jmp end


	;======================
 
seven:
		ldi r31,2
		ldi r30,0
		ldi r29,1
		ldi r28,3
		ldi r27,0
		ldi r26,0
		clr r16
		cp r21,r22
		brcc odd1
		mov r23,r21		
  	    mov r21,r22		
		mov r22,r23	
		mov r26,r22
		mov r27,r22
		jmp odd1

	odd1:
			cp r22,r31		
			mov r17,r22    
			brcs load8	
			sub r22,r31	
			inc r16			
			jmp odd1	
	load8:
			cpi r17,1		
			brcc div3		
			jmp notex		

   notex:
	  ldi r16,0
	  jmp end
	   
   div3:

   cp r26,r28
			mov r17,r26    
			brcs load22
			sub r26,r28          
			inc r16			
			jmp div3       
	load22:
			cpi r17,1		
			brcc notex      
			jmp final 
	 

   final:
	  mov r16,r27
	  jmp end
	 
	  
	  
   ;========================
   eight:
	    clr r16
		ldi r30,0
		ldi r31,2
		ldi r29,1
		ldi r24,0
		ldi r25,7
		ldi r27,0
	
	    cp r21,r22
	    brcc odd2
		mov r23,r21		
        mov r21,r22		
		mov r22,r23	
		mov r27,r22	
		mov r26,r22
		jmp odd2

	odd2:
			cp r22,r31
			mov r17,r22     
			brcs load4	
			sub r22,r31      
			inc r16			
			jmp odd2	
	load4:
			cpi r17,1		
			brcc div7	
			jmp notex1	
	
	div7:
	cp r26,r25     
			mov r17,r26    
			brcs load23    
			sub r26,r25        
			inc r16			
			jmp div7      
	load23:
			cpi r17,1		
			brcc notex1     
			jmp final2

		 notex1:
	  ldi r16,0
	  jmp end

	final2:
		mov r16,r24
		jmp end	  
	  
end:
