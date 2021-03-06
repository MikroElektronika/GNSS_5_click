Click_GNSS5_STM_gnss5_configTimer:
;click_gnss5_timer.h,15 :: 		static void gnss5_configTimer()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_gnss5_timer.h,17 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;click_gnss5_timer.h,18 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;click_gnss5_timer.h,19 :: 		TIM2_PSC = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;click_gnss5_timer.h,20 :: 		TIM2_ARR = 35999;
MOVW	R1, #35999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;click_gnss5_timer.h,21 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;click_gnss5_timer.h,22 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
_SX	[R0, ByteOffset(TIM2_DIER+0)]
;click_gnss5_timer.h,23 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;click_gnss5_timer.h,24 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;click_gnss5_timer.h,25 :: 		}
L_end_gnss5_configTimer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Click_GNSS5_STM_gnss5_configTimer
_Timer_interrupt:
;click_gnss5_timer.h,27 :: 		void Timer_interrupt() iv IVT_INT_TIM2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_gnss5_timer.h,29 :: 		gnss5_tick();
BL	_gnss5_tick+0
;click_gnss5_timer.h,30 :: 		timerCounter++;
MOVW	R1, #lo_addr(_timerCounter+0)
MOVT	R1, #hi_addr(_timerCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;click_gnss5_timer.h,31 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;click_gnss5_timer.h,32 :: 		}
L_end_Timer_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer_interrupt
_gnss5_default_handler:
;Click_GNSS5_STM.c,51 :: 		void gnss5_default_handler( uint8_t *rsp, uint8_t *evArgs )
; rsp start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; rsp end address is: 0 (R0)
; rsp start address is: 0 (R0)
;Click_GNSS5_STM.c,54 :: 		tmp = rsp;
STR	R0, [SP, #8]
;Click_GNSS5_STM.c,56 :: 		mikrobus_logWrite( tmp, _LOG_TEXT );
STR	R0, [SP, #4]
MOVS	R1, #1
BL	_mikrobus_logWrite+0
LDR	R0, [SP, #4]
;Click_GNSS5_STM.c,57 :: 		if(*rsp == '$')
LDRB	R2, [R0, #0]
; rsp end address is: 0 (R0)
CMP	R2, #36
IT	NE
BNE	L_gnss5_default_handler0
;Click_GNSS5_STM.c,59 :: 		memset(&demoBuffer[0], 0, 500);
MOVW	R2, #500
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(_demoBuffer+0)
MOVT	R0, #hi_addr(_demoBuffer+0)
BL	_memset+0
;Click_GNSS5_STM.c,60 :: 		strcpy(demoBuffer, tmp);
LDR	R1, [SP, #8]
MOVW	R0, #lo_addr(_demoBuffer+0)
MOVT	R0, #hi_addr(_demoBuffer+0)
BL	_strcpy+0
;Click_GNSS5_STM.c,61 :: 		}
L_gnss5_default_handler0:
;Click_GNSS5_STM.c,62 :: 		}
L_end_gnss5_default_handler:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _gnss5_default_handler
_systemInit:
;Click_GNSS5_STM.c,64 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_GNSS5_STM.c,66 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #6
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_GNSS5_STM.c,67 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_GNSS5_STM.c,68 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_GNSS5_STM.c,69 :: 		mikrobus_uartInit( _MIKROBUS1, &_GNSS5_UART_CFG[0] );
MOVW	R0, #lo_addr(__GNSS5_UART_CFG+0)
MOVT	R0, #hi_addr(__GNSS5_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_uartInit+0
;Click_GNSS5_STM.c,70 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
MOVW	R1, #9600
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_GNSS5_STM.c,71 :: 		mikrobus_logWrite( " ---- System Init ---- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,72 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_GNSS5_STM.c,74 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_GNSS5_STM.c,77 :: 		gnss5_configTimer();
BL	Click_GNSS5_STM_gnss5_configTimer+0
;Click_GNSS5_STM.c,80 :: 		gnss5_uartDriverInit((T_GNSS5_P)&_MIKROBUS1_GPIO, (T_GNSS5_P)&_MIKROBUS1_UART);
MOVW	R1, #lo_addr(__MIKROBUS1_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS1_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_gnss5_uartDriverInit+0
;Click_GNSS5_STM.c,81 :: 		gnss5_coreInit( gnss5_default_handler, 1500 );
MOVW	R0, #lo_addr(_gnss5_default_handler+0)
MOVT	R0, #hi_addr(_gnss5_default_handler+0)
MOVW	R1, #1500
BL	_gnss5_coreInit+0
;Click_GNSS5_STM.c,84 :: 		gnss5_hfcEnable( 1 );
MOVS	R0, #1
BL	_gnss5_hfcEnable+0
;Click_GNSS5_STM.c,85 :: 		gnss5_modulePower( 1 );
MOVS	R0, #1
BL	_gnss5_modulePower+0
;Click_GNSS5_STM.c,87 :: 		Delay_ms( 5000 );
MOVW	R7, #34559
MOVT	R7, #915
NOP
NOP
L_applicationInit1:
SUBS	R7, R7, #1
BNE	L_applicationInit1
NOP
NOP
NOP
;Click_GNSS5_STM.c,88 :: 		timerCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_timerCounter+0)
MOVT	R0, #hi_addr(_timerCounter+0)
STR	R1, [R0, #0]
;Click_GNSS5_STM.c,89 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_GNSS5_STM.c,91 :: 		void applicationTask()
SUB	SP, SP, #56
STR	LR, [SP, #0]
;Click_GNSS5_STM.c,96 :: 		char rspCom[ 50 ] = {0};
ADD	R11, SP, #4
ADD	R10, R11, #50
MOVW	R12, #lo_addr(?ICSapplicationTask_rspCom_L0+0)
MOVT	R12, #hi_addr(?ICSapplicationTask_rspCom_L0+0)
BL	___CC2DW+0
;Click_GNSS5_STM.c,99 :: 		gnss5_process();
BL	_gnss5_process+0
;Click_GNSS5_STM.c,101 :: 		if(timerCounter > 5000)
MOVW	R0, #lo_addr(_timerCounter+0)
MOVT	R0, #hi_addr(_timerCounter+0)
LDR	R1, [R0, #0]
MOVW	R0, #5000
CMP	R1, R0
IT	LS
BLS	L_applicationTask3
;Click_GNSS5_STM.c,103 :: 		pFlag++;
MOVW	R1, #lo_addr(_pFlag+0)
MOVT	R1, #hi_addr(_pFlag+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;Click_GNSS5_STM.c,104 :: 		if(pFlag > 2)
CMP	R0, #2
IT	LS
BLS	L_applicationTask4
;Click_GNSS5_STM.c,106 :: 		pFlag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pFlag+0)
MOVT	R0, #hi_addr(_pFlag+0)
STRB	R1, [R0, #0]
;Click_GNSS5_STM.c,107 :: 		}
L_applicationTask4:
;Click_GNSS5_STM.c,108 :: 		timerCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_timerCounter+0)
MOVT	R0, #hi_addr(_timerCounter+0)
STR	R1, [R0, #0]
;Click_GNSS5_STM.c,109 :: 		dispFlag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dispFlag+0)
MOVT	R0, #hi_addr(_dispFlag+0)
STRB	R1, [R0, #0]
;Click_GNSS5_STM.c,110 :: 		}
L_applicationTask3:
;Click_GNSS5_STM.c,112 :: 		if(pFlag == 0 && dispFlag == 1)
MOVW	R0, #lo_addr(_pFlag+0)
MOVT	R0, #hi_addr(_pFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__applicationTask26
MOVW	R0, #lo_addr(_dispFlag+0)
MOVT	R0, #hi_addr(_dispFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__applicationTask25
L__applicationTask24:
;Click_GNSS5_STM.c,114 :: 		mikrobus_logWrite( "  ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr2_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,115 :: 		mikrobus_logWrite( " ---------------------------------------- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr3_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr3_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,116 :: 		pLat = gnss5_parser(&demoBuffer[0], &demoCommand[0], 2);
MOVS	R2, #2
MOVW	R1, #lo_addr(_demoCommand+0)
MOVT	R1, #hi_addr(_demoCommand+0)
MOVW	R0, #lo_addr(_demoBuffer+0)
MOVT	R0, #hi_addr(_demoBuffer+0)
BL	_gnss5_parser+0
; pLat start address is: 4 (R1)
MOV	R1, R0
;Click_GNSS5_STM.c,118 :: 		if(pLat == 0)
CMP	R0, #0
IT	NE
BNE	L_applicationTask8
; pLat end address is: 4 (R1)
;Click_GNSS5_STM.c,120 :: 		mikrobus_logWrite( " Latitude : No data available!", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr4_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr4_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,121 :: 		}
IT	AL
BAL	L_applicationTask9
L_applicationTask8:
;Click_GNSS5_STM.c,124 :: 		strcpy(&rspCom[0], pLat);
; pLat start address is: 4 (R1)
ADD	R0, SP, #4
; pLat end address is: 4 (R1)
BL	_strcpy+0
;Click_GNSS5_STM.c,125 :: 		mikrobus_logWrite( " Latitude : ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr5_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr5_Click_GNSS5_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,126 :: 		mikrobus_logWrite(rspCom, _LOG_LINE);
ADD	R0, SP, #4
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,127 :: 		}
L_applicationTask9:
;Click_GNSS5_STM.c,128 :: 		dispFlag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dispFlag+0)
MOVT	R0, #hi_addr(_dispFlag+0)
STRB	R1, [R0, #0]
;Click_GNSS5_STM.c,129 :: 		mikrobus_logWrite( " ---------------------------------------- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr6_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr6_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,112 :: 		if(pFlag == 0 && dispFlag == 1)
L__applicationTask26:
L__applicationTask25:
;Click_GNSS5_STM.c,132 :: 		if(pFlag == 2 &&  dispFlag == 1)
MOVW	R0, #lo_addr(_pFlag+0)
MOVT	R0, #hi_addr(_pFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L__applicationTask28
MOVW	R0, #lo_addr(_dispFlag+0)
MOVT	R0, #hi_addr(_dispFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__applicationTask27
L__applicationTask23:
;Click_GNSS5_STM.c,134 :: 		mikrobus_logWrite( "  ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr7_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr7_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,135 :: 		mikrobus_logWrite( " ---------------------------------------- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr8_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr8_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,136 :: 		pAlt = gnss5_parser(&demoBuffer[0], &demoCommand[0], 9);
MOVS	R2, #9
MOVW	R1, #lo_addr(_demoCommand+0)
MOVT	R1, #hi_addr(_demoCommand+0)
MOVW	R0, #lo_addr(_demoBuffer+0)
MOVT	R0, #hi_addr(_demoBuffer+0)
BL	_gnss5_parser+0
; pAlt start address is: 4 (R1)
MOV	R1, R0
;Click_GNSS5_STM.c,137 :: 		if(pAlt == 0)
CMP	R0, #0
IT	NE
BNE	L_applicationTask13
; pAlt end address is: 4 (R1)
;Click_GNSS5_STM.c,139 :: 		mikrobus_logWrite( " Altitude : No data available!", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr9_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr9_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,140 :: 		}
IT	AL
BAL	L_applicationTask14
L_applicationTask13:
;Click_GNSS5_STM.c,143 :: 		strcpy(&rspCom[0], pAlt);
; pAlt start address is: 4 (R1)
ADD	R0, SP, #4
; pAlt end address is: 4 (R1)
BL	_strcpy+0
;Click_GNSS5_STM.c,144 :: 		mikrobus_logWrite( " Altitude : ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr10_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr10_Click_GNSS5_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,145 :: 		mikrobus_logWrite(rspCom, _LOG_LINE);
ADD	R0, SP, #4
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,146 :: 		}
L_applicationTask14:
;Click_GNSS5_STM.c,147 :: 		dispFlag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dispFlag+0)
MOVT	R0, #hi_addr(_dispFlag+0)
STRB	R1, [R0, #0]
;Click_GNSS5_STM.c,148 :: 		mikrobus_logWrite( " ---------------------------------------- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr11_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr11_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,132 :: 		if(pFlag == 2 &&  dispFlag == 1)
L__applicationTask28:
L__applicationTask27:
;Click_GNSS5_STM.c,151 :: 		if(pFlag == 1 && dispFlag == 1)
MOVW	R0, #lo_addr(_pFlag+0)
MOVT	R0, #hi_addr(_pFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__applicationTask30
MOVW	R0, #lo_addr(_dispFlag+0)
MOVT	R0, #hi_addr(_dispFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__applicationTask29
L__applicationTask22:
;Click_GNSS5_STM.c,153 :: 		mikrobus_logWrite( "  ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr12_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr12_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,154 :: 		mikrobus_logWrite( " ---------------------------------------- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr13_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr13_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,155 :: 		pLong = gnss5_parser(&demoBuffer[0], &demoCommand[0], 4);
MOVS	R2, #4
MOVW	R1, #lo_addr(_demoCommand+0)
MOVT	R1, #hi_addr(_demoCommand+0)
MOVW	R0, #lo_addr(_demoBuffer+0)
MOVT	R0, #hi_addr(_demoBuffer+0)
BL	_gnss5_parser+0
; pLong start address is: 4 (R1)
MOV	R1, R0
;Click_GNSS5_STM.c,156 :: 		if(pLong == 0)
CMP	R0, #0
IT	NE
BNE	L_applicationTask18
; pLong end address is: 4 (R1)
;Click_GNSS5_STM.c,158 :: 		mikrobus_logWrite( " Longitude : No data available!", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr14_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr14_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,159 :: 		}
IT	AL
BAL	L_applicationTask19
L_applicationTask18:
;Click_GNSS5_STM.c,162 :: 		strcpy(&rspCom[0], pLong);
; pLong start address is: 4 (R1)
ADD	R0, SP, #4
; pLong end address is: 4 (R1)
BL	_strcpy+0
;Click_GNSS5_STM.c,163 :: 		mikrobus_logWrite( " Longitude : ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr15_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr15_Click_GNSS5_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,164 :: 		mikrobus_logWrite(rspCom, _LOG_LINE);
ADD	R0, SP, #4
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,165 :: 		}
L_applicationTask19:
;Click_GNSS5_STM.c,166 :: 		dispFlag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dispFlag+0)
MOVT	R0, #hi_addr(_dispFlag+0)
STRB	R1, [R0, #0]
;Click_GNSS5_STM.c,167 :: 		mikrobus_logWrite( " ---------------------------------------- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr16_Click_GNSS5_STM+0)
MOVT	R0, #hi_addr(?lstr16_Click_GNSS5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GNSS5_STM.c,151 :: 		if(pFlag == 1 && dispFlag == 1)
L__applicationTask30:
L__applicationTask29:
;Click_GNSS5_STM.c,169 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #56
BX	LR
; end of _applicationTask
_main:
;Click_GNSS5_STM.c,171 :: 		void main()
;Click_GNSS5_STM.c,173 :: 		systemInit();
BL	_systemInit+0
;Click_GNSS5_STM.c,174 :: 		applicationInit();
BL	_applicationInit+0
;Click_GNSS5_STM.c,176 :: 		while (1)
L_main20:
;Click_GNSS5_STM.c,178 :: 		applicationTask();
BL	_applicationTask+0
;Click_GNSS5_STM.c,179 :: 		}
IT	AL
BAL	L_main20
;Click_GNSS5_STM.c,180 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
