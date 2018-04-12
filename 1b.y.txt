%{
    #include<stdio.h>
    int valid=1;
%}
%token num;
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%%
stmt:expr{
        if(valid)
        {
            printf("\nResult = %d",$$);
        }
     }
expr: expr'+'expr {$$=$1+$3;}
|expr'-'expr {$$=$1-$3;}
|expr'*'expr {$$=$1*$3;}
|expr'/'expr {    if($3==0)
                valid=0;
            else
                $$=$1/$3;
        }
|'('expr')' {$$=$2;}
|'-'expr {$$=$2;}
|num {$$=$1;}
;
%%
void main()
{
    printf("\nEnter the arithmetic expression:");
    yyparse();
    if(valid == 1)
        printf("\nExpression is valid!");
}
int yyerror()
{
    printf("\nInvalid Expression");
    exit(0);
}
