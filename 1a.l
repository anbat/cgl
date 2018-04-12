%{
    #include<stdio.h>
    #include<string.h>
    int noprt=0,nopnd=0,top=0,l=0,j=0;
    char opnd[10][10],oprt[10][10],a[10];
%}
%%
"(" {    top=1;    }
")" {    top=0;    }
"+"|"*" {    noprt++;
        strcpy(oprt[l],yytext);
        l++;
    }
[0-9]+ {    nopnd++;
        strcpy(opnd[j],yytext);
        j++;
       }
[^+*]"("[^0-9] {
    yyfail();
}
%%
int yywrap()
{
    return 1;
}
int yyfail()
{
    printf("Invalid");
    exit(0);
}
int main()
{
    int k;
    printf("\nEnter the expression....at end press ^d:");
    yylex();
    if(top == 0 && (nopnd-noprt)==1)
    {
        printf("\nThe expression is valid!");
        printf("\nNo of operators = %d",l);
        printf("\nThe Operators are:");
        printf("\n");
        for(k=0;k<l;k++)
            printf("%s\n",oprt[k]);
        printf("Number of identifiers = %d",j);
        printf("\nThe identifiers are:");
        for(k=0;k<j;k++)
            printf("%s\n",opnd[k]);
    }
    else
        printf("The operator is Invalid");
        return 0;
}   
