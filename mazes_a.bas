10 REM ****SETUP*********
20 SCREEN 1:COLOR 15,0,0:KEYOFF
30 RESTORE60000:D2=BASE(10):WD=16:HG=16
40 FOR I=0 TO 15:FOR J=0 TO 7
50 READ V: VPOKE I*8+J,V
60 NEXT J:NEXT I
70 FOR I=0 TO 7:READ V:S$=S$+CHR$(V):NEXTI
80 SPRITE$(1)=S$
90 GOTO 110
100 FOR I=0 TO HG-1:FOR J=0 TO WD-1:VPOKE D2+I*32+J,0:NEXTJ,I
110 KK=RND(-1)
120 REM ****CREACION LABERINTO*******
130 DIM VI(HG*WD):PX=INT(WD/2):PY=INT(HG/2):TV=1
135 ST=PY*WD+PX
140 DIM BT(HG*WD):DIM LB(HG*WD):DIM DR(4)
150 BT(0)=ST:SP=0:VI(ST)=1
160 SX=8*PX:SY=8*PY:BX=ST:BM=0
170 PUTSPRITE1,(SX,SY),4,1
180 REM *COMPROBAR SI HAY VECINOS VISITABLES*
190 V1=0
200 IF PX>0 THEN CX=PX-1: IX=PY*WD+CX: IF VI(IX)<1 THEN V1=V1+1:DR(V1)=1
210 IF PX<WD-1 THEN CX=PX+1: IX=PY*WD+CX: IF VI(IX)<1 THEN V1=V1+1:DR(V1)=2
220 IF PY>0 THEN CY=PY-1: IY=CY*WD+PX: IF VI(IY)<1 THEN V1=V1+1:DR(V1)=3
230 IF PY<HG-1 THEN CY=PY+1: IY=CY*WD+PX: IF VI(IY)<1 THEN V1=V1+1:DR(V1)=4
240 IF V1>0 THEN 290
250 REM *** BACKTRACE ***
260 SP=SP-1:IF SP<0 THEN 59999
270 IX=BT(SP):PY=INT(IX/WD):PX=IX-WD*PY:SX=PX*8:SY=PY*8:PUTSPRITE1,(SX,SY),6,1
280 GOTO 190
290 LL=PX+PY*WD
300 IF V1=1 THEN OP=DR(V1) ELSE OP=DR(INT(V1*RND(1)+1))
310 IF OP=1 THEN NX=PX-1:NY=PY:NL=NX+NY*WD:LB(LL)=LB(LL)+8:LB(NL)=LB(NL)+2
320 IF OP=2 THEN NX=PX+1:NY=PY:NL=NX+NY*WD:LB(LL)=LB(LL)+2:LB(NL)=LB(NL)+8
330 IF OP=3 THEN NY=PY-1:NX=PX:NL=NX+NY*WD:LB(LL)=LB(LL)+1:LB(NL)=LB(NL)+4
340 IF OP=4 THEN NY=PY+1:NX=PX:NL=NX+NY*WD:LB(LL)=LB(LL)+4:LB(NL)=LB(NL)+1
350 VPOKE D2+NX+NY*32,LB(NL)
360 VPOKE D2+PX+PY*32,LB(LL)
370 VI(NL)=1:TV=TV+1
380 PX=NX:PY=NY:SX=PX*8:SY=PY*8:PUTSPRITE1,(SX,SY),4,1
390 SP=SP+1:BT(SP)=NL:IF SP>BM THEN BM=SP:BX=BT(SP)
400 IF TV<HG*WD THEN 190
420 PY=INT(BX/WD):PX=BX-PY*WD:SX=PX*8:SY=PY*8
430 PUTSPRITE1,(SX,SY),4,1
440 A=STICK(0):ON A GOSUB 490, 999,490,999,490,999,490
450 A$=INKEY$
460 IF A$="" THEN V=0 ELSE V=ASC(A$)
470 IF V=27 THEN LOCATE0,17:END
475 IF A$="S" THEN GOSUB 2000
480 GOTO 440
490 PX=CINT(SX/8):PY=CINT(SY/8)
495 LL=PY*WD+PX:PA=LB(LL)
500 IF A=3 AND (PA AND 2)  THEN SX=SX+4
520 IF A=7 AND ((PA AND 8) XOR SX-PX*8>0) THEN SX=SX-4 
530 IF A=1 AND ((PA AND 1) XOR SY-PY*8>0) THEN SY=SY-4 
540 IF A=5 AND (PA AND 4)  THEN SY=SY+4
550 PUTSPRITE1,(SX,SY),4,1
999 RETURN 440
2000 D0=&HA800
2010 FOR I=0 TO 15:FOR J=0 TO 7
2020 POKE D0,VPEEK(I*8+J):D0=D0+1
2030 NEXTJ:NEXTI
2040 POKE D0,HG:POKE D0+1,WD
2050 D0=D0+2
2060 FOR I=0 TO HG*WD-1:POKE D0,LB(I):D0=D0+1:NEXTI
2090 BSAVE"A:MAZE.BIN",&HA800, D0
2100 RETURN 440
59999 LOCATE 0,17:PRINT"ERROR BACKTRACE":END
60000 DATA &HFF,&H81,&H81,&H81,&H81,&H81,&H81,&HFF
60010 DATA &H81,&H81,&H81,&H81,&H81,&H81,&H81,&HFF
60020 DATA &HFF,&H80,&H80,&H80,&H80,&H80,&H80,&HFF
60030 DATA &H80,&H80,&H80,&H80,&H80,&H80,&H80,&HFF
60040 DATA &HFF,&H81,&H81,&H81,&H81,&H81,&H81,&H81
60050 DATA &H81,&H81,&H81,&H81,&H81,&H81,&H81,&H81
60060 DATA &HFF,&H80,&H80,&H80,&H80,&H80,&H80,&H80
60070 DATA &H80,&H80,&H80,&H80,&H80,&H80,&H80,&H80
60080 DATA &HFF,&H01,&H01,&H01,&H01,&H01,&H01,&HFF
60090 DATA &H01,&H01,&H01,&H01,&H01,&H01,&H01,&HFF
60100 DATA &HFF,&H00,&H00,&H00,&H00,&H00,&H00,&HFF
60110 DATA &H00,&H00,&H00,&H00,&H00,&H00,&H00,&HFF
60120 DATA &HFF,&H01,&H01,&H01,&H01,&H01,&H01,&H01
60130 DATA &H01,&H01,&H01,&H01,&H01,&H01,&H01,&H01
60140 DATA &HFF,&H00,&H00,&H00,&H00,&H00,&H00,&H00
60150 DATA &H00,&H00,&H00,&H00,&H00,&H00,&H00,&H00
60160 DATA &H18,&H3C,&H7E,&H7E,&H3C,&H18,&H00,&H00
