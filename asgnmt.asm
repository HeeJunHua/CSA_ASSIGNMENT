.MODEL SMALL
.STACK 1500
.DATA
;Login & Register =========================

;Main Menu Data=========================
wlcmMsg db 10,13,"Welcome to our Hotel Reservation System"
        db 10,13,"1.User Profile"
        db 10,13,"2.Room Booking"
        db 10,13,"3.Booking Modification"
        db 10,13,"4.Payment"
        db 10,13,"5.Exit"
        db 10,13,"Please enter your choice: $"
userChoice db ?
;User profile=========================== // User Profile Function
userProfileTitle        db "User Profile"
                        db 10,13, "============"
                        db 10,13, "1. View Profile"
                        db 10,13, "2. Edit Profile"
                        db 10,13, "3. Top Up Balance"
                        db 10,13, "4. Back"
                        db 10,13, "Please Enter Your Choice (1-4): $"

viewProfileTitle        db "View Profile"
                        db 10,13, "============$"

displayName             db "Name: $"
displayPass             db "Password: $"
displayUserBalance      db "Current Balance: $"
displayCreditCardId     db "Credit Card ID: $"
displayBookingTable     db " "

userName                db "Tan Kim Wah"
userPass                db "Abc123abc123-"
userBalance             db "50.00"
userCreditCardID        db "1111 2222 3333 4444"
userBookingHistory      db ?


newName                 label     byte
nameSize                db        30
actName                 db        ?
outputNewName           db        30 dup ("$")
promptNewName           db        10,13, "Please Enter Your New Name: $"  

newPass                 label     byte
passSize                db        30
actPass                 db        ?
outputNewPass           db        30 dup ("$")
promptNewPass           db        10,13, "Please Enter Your New Password (8-30): $"  

addUserCreditCardNo     label     byte
creditCardSize          db        16
actCreditCard           db        ?
outputNewCreditCard     db        16 dup ("$")

saveUserCreditCardID    db ?

displayRinggit db "RM$"

mainMenuChoice db ?

choiceError db "Invalid Choice - Please Enter Between 1-4! $"

;Room Booking===========================
locations       db " 1. Selangor"
                db " 2. Kuala Lumpur"
                db " 3. Pahang"
                db " 4. Penang"
                db " 5. Negeri Sembilan"
                db " 6. Johor"
                db " 7. Perlis"
                db " 8. Kelantan"



;Bookings Modification==================
modifyBooking            db 10,13,"=======BOOKING MODIFICATION======="
                         db 10,13,"1.Edit Bookmark"
                         db 10,13,"2.Room Confirmation"
                         db 10,13,"3.Review Booking History"
                         db 10,13,"4.Back"
                         db 10,13,"Please enter your choice: $"
userBookingSelection     db ?
bookingErrorSelection    db 10,13,"Please enter 1 to 4 only $"



;Payment================================
paymentSub  DB 13,10,"===Payment==="
            DB 13,10,"1.Check out"
            DB 13,10,"2.Check Balance"
            DB 13,10,"3.Payment History"
            DB 13,10,"4.Back $"
paymentSub2 DB 13,10,"1.Back to payment selection."
	    DB 13,10,"2.Back to main menu.$"
paymentStart DB 13,10,"Enter your choice: $"
iresponse  DB 13,10,"Please choose between 1-4 !$"
paymentStr1  DB 13,10,"CHECKOUT PAGE$"
paymentStr2  DB 13,10,"CHECK BALANCE PAGE$"
paymentStr3  DB 13,10,"PAYMENT HISTORY PAGE$"
paymentStr4  DB 13,10,"CURRENT ACCOUNT BALANCE: $"
balance      DB "5000.00 $"
paymentStr5  DB "Do you wish to top up your balance? (y/n) $"
paymentStr6  DB "Do you want to proceed with the payment? (y/n) $"
paymentStr7  DB "Payment Success!  $"


.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX


;-------------------------------------------------------------------MAINMENU START----------------------------------------------------------------------
MAINMENU:
MOV AH,09H
LEA dx,wlcmMsg
INT 21H

MOV AH,01H
INT 21H
MOV userChoice,AL

MOV AL,userChoice
CMP AL,'1'
JE USERPROFILE
JNE CHOICE2

CHOICE2:
MOV AL,userChoice
CMP AL,'2'
JE ROOMBOOKING
JNE CHOICE3

CHOICE3:
MOV AL,userChoice
CMP AL,'3'
JE BOOKINGMODIFICATION
JNE CHOICE4

CHOICE4:
MOV AL,userChoice
CMP AL,'4'
JE PAYMENT
JNE CHOICE5

CHOICE5:
MOV AL,userChoice
CMP AL,'5'
JE EXIT

;-------------------------------------------------------------------MAINMENU END----------------------------------------------------------------------











;-------------------------------------------------------------------USERPROFILE START----------------------------------------------------------------------

USERPROFILE:; User Profile Function
mov ah,00
mov al,02
int 10h
mov al, 0
MOV AH, 09H
LEA DX,userProfileTitle ; 1. View Profile, 2. Edit Profile, 3. Top Up Balance
INT 21H
mov ah,01H; Input Main Menu Choice
int 21h
CMP al, '1'
JE VIEWPROFILE
JL USERPROFILE_MENUCHOICE_ERROR
CMP al, '2'
JE EDITPROFILE
CMP al, '3'
JE TOPUPBALANCE
CMP al, '4'
JE MAINMENU
JG USERPROFILE_MENUCHOICE_ERROR

VIEWPROFILE:

EDITPROFILE:

TOPUPBALANCE:

USERPROFILE_MENUCHOICE_ERROR:
mov ah, 02H;
mov dl, nextLine;
int 21h;
mov ah, 02H;
mov dl, nextLine;
int 21h;
mov ah, 09H;
lea dx, choiceError
int 21h;
mov ah,01h
int 21h;
JMP USERPROFILE





;-------------------------------------------------------------------USERPROFILE END----------------------------------------------------------------------












;-------------------------------------------------------------------ROOMBOOKING START----------------------------------------------------------------------
ROOMBOOKING:
JMP MAINMENU

;-------------------------------------------------------------------ROOMBOOKING END----------------------------------------------------------------------









;-------------------------------------------------------------------BOOKINGMODIFY START----------------------------------------------------------------------
BOOKINGMODIFICATION:
JMP MAINMENU

;-------------------------------------------------------------------BOOKINGMODIFY END----------------------------------------------------------------------












;-------------------------------------------------------------------PAYMENT START----------------------------------------------------------------------
PAYMENT:
;----OUTPUT PAYMENT SUBMENU
MOV AH, 09H
LEA DX, paymentSub
INT 21H

PROMPT:
;----PROMPT MESSAGE
MOV AH, 09H
LEA DX, paymentStart
INT 21H

;---INPUT USER CHOICE (01H)
MOV AH, 01H
INT 21H

MOV AH, 09H
LEA DX, newLine
INT 21H

CMP AL, "1"
JE CHKOUT
CMP AL, "2"
JE CHKBLC
CMP AL, "3"
JE PAYHISTORY

MOV AH, 09H
LEA DX, iresponse
INT 21H
JMP PROMPT




CHKOUT:
MOV AH, 09H
LEA DX, paymentStr1
INT 21H
JMP EXIT


CHKBLC:
MOV AH, 09H
LEA DX, paymentStr2
INT 21H

;----OUTPUT CURRENT ACCOUNT BALANCE
MOV AH, 09
LEA DX, paymentStr4
INT 21H
MOV AH, 09H
LEA DX, balance
INT 21H


MOV AH, 09H
LEA DX, newLine
INT 21H


;----PROMPT USER TO CONTINUE





JMP EXIT



PAYHISTORY:
MOV AH, 09H
LEA DX, str3
INT 21H
JMP EXIT
;-------------------------------------------------------------------PAYMENT END------------------------------------------------------------------------




EXIT:
MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN