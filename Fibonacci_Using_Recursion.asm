;fibonacci of a number using recursion
;Chap 5: Q-3
[org 0x0100]

jmp start

fibonacci:
push bp   ;save old value of bp,nested call will destroy it's old value
mov bp,sp ;making bp a reference
sub sp,2  ;creating local variable

mov bx,[bp + 4] ; getting the parameter

cmp bx,0    ;base case: number <= 0
jle return0  ;no further recursion

cmp bx,1    ;base case: number = 1
je return1  ;no further recursion

            ;fibonacci(n)=fibonacci(n-1)+fibonacci(n-2)
push bx     ;save original value(before a recursive call) on stack
dec bx      ;for fibonacci(n-1)
push bx     ;saving in stack to be used as a parameter in recursive call, destroyed by ret 2
call fibonacci   ;recursive call because no base case reached i.e number > 1
                 ;returning point after a recursive call,bx will have it's old value
pop bx      ;retain original value(before the recursive call) from stack

mov [bp - 2],ax  ;ax has final result,save it in the local variable

push bx     ;save original value(before a recursive call) on stack
sub bx,2    ;for fibonacci(n-2)
push bx     ;saving in stack to be used as a parameter in recursive call, destroyed by ret 2
call fibonacci   ;;recursive call because no base case reached i.e number > 1
                 ;returning point after a recursive call,bx will have it's old value
pop bx      ;retain original value(before the recursive call) from stack

mov dx,[bp - 2] ;saving previous value of ax
add dx,ax       ;accumulating result
mov ax,dx       ;return fibonacci in ax
jmp retfromfunction

return0:
mov ax,0    ;ax holds the final result
jmp retfromfunction

return1:
mov ax,1    ;ax holds the final result

retfromfunction:
mov sp,bp  ;restore old value of sp and deallocates space for local variable
pop bp     ;restore old value of bp
ret 2      ;return from function and clear parameter from stack

start:

mov ax,6  ; number for calculating fibonnaci
push ax   ; passing the parameter using stack
call fibonacci
          ;after all recursive calls final result will be in ax

mov ax,0x4c00
int 0x21