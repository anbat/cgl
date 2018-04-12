%{
    #include<stdio.h>
    int acount=0,n;
%}
%token A
%token B
%%
S:X B {    if(acount<n||acount>n)
    {
        printf("\nError");
        exit(0);
    }
     }
X:X T|T
T:A {    acount++;    }
;
%%
void main()
{
    printf("\nEnter the value of n:");
    scanf("%d",&n);
    printf("\nEnter the string: ");
    yylex();
    yyparse();
    printf("valid string");
}

int yyerror()
{
    printf("Invalid string\n");
    exit(0);
}

