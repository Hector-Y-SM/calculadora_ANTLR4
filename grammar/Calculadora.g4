grammar Calculadora;

file: expr+;          

expr:
        OPEN expr operation=CLOSE expr #reverse
        |
        expr operation=OPEN expr CLOSE #normal
        |
        OPEN expr operation=DEFAULT expr CLOSE     #default
        | 
        OPEN expr CLOSE      #parenthesis
        | 
        expr operation=(TIMES|DIV) expr     #timesDiv
        | 
        expr operation=(PLUS|MINUS) expr    #plusSubtraction
        |
        NUMBER   #number
        | 
        DECIMAL #decimal
        ;

PLUS    :   '+'  ;
DEFAULT :   ')(' ;
MINUS   :   '-'  ;
TIMES   :   '*'  ;
DIV     :   '/'  ;
OPEN    :   '('  ;
CLOSE   :   ')'  ;
NUMBER  :   [0-9]+;
DECIMAL :   [0-9]+'.'[0-9]+;
SPACES  :   [ \t\r\n]+ -> skip;