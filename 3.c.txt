 
#include<stdio.h> 
#include<string.h>
 
predictiveparser() 
{ 
    char fin[10][20],st[10][20],ft[20][20],fol[20][20]; 
    int a=0,e,i,t,b,c,n,k,l=0,j,s,m,p; 
    printf("Enter the no. of Nonterminals\n"); 
    scanf("%d",&n); 
    printf("Enter the productions in a grammar\n"); 
    for(i=0;i<n;i++) 
    scanf("%s",st[i]); 
    for(i=0;i<n;i++) 
    fol[i][0]='\0'; 
    for(s=0;s<n;s++) 
    { 
        for(i=0;i<n;i++) 
        {
            j=3;  
            l=0; 
            a=0; 
        l1:   if(!((st[i][j]>64)&&(st[i][j]<91))) 
            { 
                for(m=0;m<l;m++) 
                { 
                    if(ft[i][m]==st[i][j])  
                    goto s1; 
                } 
                ft[i][l]=st[i][j];  
                l=l+1; 
            s1: j=j+1; 
            } 
            else 
            { 
                if(s>0) 
                { 
                    while(st[i][j]!=st[a][0]) 
                    { 
                        a++; 
                    }  
                    b=0; 
                     while(ft[a][b]!='\0') 
                    { 
                        for(m=0;m<l;m++) 
                        { 
                            if(ft[i][m]==ft[a][b])  
                            goto s2; 
                        } 
                        ft[i][l]=ft[a][b]; 
                        l=l+1;  
                        s2: b=b+1; 
                    } 
                } 
            } 
            while(st[i][j]!='\0') 
            { 
                if(st[i][j]=='|') 
                { 
                    j=j+1; 
                    goto l1; 
                } 
                j=j+1; 
            } 
            ft[i][l]='\0'; 
        } 
    } 
    printf("\n  FIRST SET  :\n"); 
    for(i=0;i<n;i++) 
    printf("FIRS[%c]= %s\t\n",st[i][0],ft[i]); 
    fol[0][0]='$'; 
    for(i=0;i<n;i++) 
    { 
        k=0; 
        j=3; 
        if(i==0) 
            l=1; 
        else  
            l=0; 
        k1:while((st[i][0]!=st[k][j])&&(k<n)) 
           { 
            if(st[k][j]=='\0') 
            { 
                k++; 
                 j=2; 
  
            } 
            j++; 
        } 
        j=j+1;  
        if(st[i][0]==st[k][j-1]) 
        { 
            if((st[k][j]!='|')&&(st[k][j]!='\0')) 
            { 
                a=0; 
                if(!((st[k][j]>64)&&(st[k][j]<91))) 
                { 
                    for(m=0;m<l;m++) 
                    { 
                        if(fol[i][m]==st[k][j]) 
                         goto q3; 
                    } 
                    q3: fol[i][l]=st[k][j]; 
                    l++; 
                } 
                else 
                { 
                    while(st[k][j]!=st[a][0]) 
                    {
                        a++; 
                    }  
                    p=0; 
                    while(ft[a][p]!='\0') 
                    { 
                        if(ft[a][p]!='@') 
                        { 
                            for(m=0;m<l;m++) 
                            { 
                                if(fol[i][m]==ft[a][p])  
                                goto q2; 
                            } 
                            fol[i][l]=ft[a][p];  
                            l=l+1; 
                        } 
                        else 
                            e=1;  
                        q2: p++; 
                    } 
                    if(e==1) 
                    { 
                        e=0; 
                        goto a1; 
                    } 
                } 
            } 
            else 
            { 
                a1: c=0; a=0; 
                while(st[k][0]!=st[a][0]) 
                { 
                    a++; 
  
                } 
                while((fol[a][c]!='\0')&&(st[a][0]!=st[i][0])) 
                { 
                    for(m=0;m<l;m++) 
                    { 
                        if(fol[i][m]==fol[a][c])  
                        goto q1; 
                    } 
                    fol[i][l]=fol[a][c]; 
                    l++; 
                    q1:c++; 
                } 
            } 
            goto k1; 
        } 
        fol[i][l]='\0'; 
    } 
    printf("\n FOLLOW SET  :\n"); 
    for(i=0;i<n;i++) 
    printf("FOLLOW[%c] = %s \n",st[i][0],fol[i]); 
    printf("\n"); 
    s=0; 
    for(i=0;i<n;i++) 
    {
        j=3; 
        while(st[i][j]!='\0') 
        { 
            if((st[i][j-1]=='|')||(j==3)) 
            { 
                for(p=0;p<=2;p++) 
                { 
                    fin[s][p]=st[i][p]; 
                } 
                t=j; 
                 for(p=3;((st[i][j]!='|')&&(st[i][j]!='\0'));p++) 
                { 
                    fin[s][p]=st[i][j];  
                    j++; 
                } 
                fin[s][p]='\0'; 
                if(st[i][t]=='@') 
                { 
                    b=0; a=0; 
                    while(st[a][0]!=st[i][0]) 
                    {
                         a++; 
                    } 
                    while(fol[a][b]!='\0') 
                    {  
                        printf("M[ %c , %c ] = %s \n",st[i][0],fol[a][b],fin[s]); 
                         b++; 
                    } 
                } 
                else if(!((st[i][t]>64)&&(st[i][t]<91))) 
                { 
                      printf("M[ %c , %c ] = %s \n",st[i][0],st[i][t],fin[s]); 
                } 
                 else 
                { 
                    b=0; 
                    a=0; 
                    while(st[a][0]!=st[i][3]) 
                    a++; 
                    while(ft[a][b]!='\0') 
                    { 
                          printf("M[ %c , %c ] = %s \n",st[i][0],ft[a][b],fin[s]); 
                         b++; 
                    } 
                }  
                 s++; 
             } 
            if(st[i][j]=='|')  
            j++; 
        } 
    } 
} 

 
parseinputstring() 
{ 
    char input[20],stack[20]; 
    char m[2][3][3]={"aBa"," "," ","@","bB"," "}; 
    int size[2][3]={3,20,0,1,2,0}; 
    int i,j,k,n,str1,str2;  
    printf("\n Enter the input string: ");  
    scanf("%s",input); 
    strcat(input,"$"); 
    n=strlen(input);  
    stack[0]='$'; 
    stack[1]='A';
    stack[2] ='\0';  
    i=1; 
    j=0; 
    printf("\nStack                Input\n"); 
    printf("--------------------------\n"); 
    printf("%s              %s\n", stack, input); 
    while((stack[i]!='$')&&(input[j]!='$')) 
    { 
        if(stack[i]==input[j] && ( stack[i] && input[j] != '$')) 
        { 
            i--;  
            j++; 
            for(k=0;k<=i;k++)  
            printf("%c",stack[k]); 
            printf("          ");  
            for(k=j;k<n;k++)  
            printf("%c",input[k]); 
            printf(" \n "); 
         }
        switch(stack[i]) 
        { 
             case 'A': str1=0; 
                    break; 
            case 'B': str1=1; 
                     break;  
        } 
        switch(input[j]) 
        { 
        case 'a': str2=0; 
              break;  
        case 'b': str2=1; 
              break;  
        case '$': str2=2; 
              break;  
 
        } 
        if(m[str1][str2][0]=='\0') 
            printf("\nERROR"); 
        else if(m[str1][str2][0]=='@')  
            i--; 
        else 
        { 
            for(k=size[str1][str2]-1;k>=0;k--) 
            { 
                stack[i]=m[str1][str2][k];  
                i++; 
            } 
            i--; 
        } 
         for(k=0;k<=i;k++)  
        printf("%c",stack[k]); 
        printf("            ");  
        for(k=j;k<=n;k++)  
        printf("%c",input[k]); 
        printf(" \n "); 
    } 
    printf("SUCCESS\n");  
} 
 
 
void main() 
{ 
    printf("\n1.  Construction of Predictive Parsing Table LL(1) for the grammar\n"); 
    printf("  A -> aBa \n  B -> bB | @ \n\n\n"); 
    predictiveparser(); 
    printf("\n\n");
    printf("The predictive parsing table is:\n");
    printf("---------------------------------------------------------\n");
    printf("|\tNT\t\t| a\t\t| b\t| $\t|\n");
    printf("---------------------------------------------------------\n");
    printf("|\tA\t\t| A->aBa\t|\t|\t|\n");
    printf("---------------------------------------------------------\n");
    printf("|\tB\t\t| B->@\t\t|B->bB\t|\t|\n");
    printf("---------------------------------------------------------\n\n\n");
     
    printf( "2.  Parsing the given input string using the above table\n\n"); 
    parseinputstring(); 
} 


/*   THE OUTPUT IS  

[root@localhost ss]# cc 3.c
[root@localhost ss]# ./a.out

1.  Construction of Predictive Parsing Table LL(1) for the grammar
  A -> aBa 
  B -> bB | @ 


Enter the no. of Nonterminals
2
Enter the productions in a grammar
A->aBa
B->bB|@

  FIRST SET  :
FIRS[A]= a  
FIRS[B]= b@  

 FOLLOW SET  :
FOLLOW[A] = $ 
FOLLOW[B] = a 

M[ A , a ] = A->aBa 
M[ B , b ] = B->bB 
M[ B , a ] = B->@ 


The predictive parsing table is:
---------------------------------------------------------
|    NT        | a        | b    | $    |
---------------------------------------------------------
|    A        | A->aBa    |    |    |
---------------------------------------------------------
|    B        | B->@        |B->bB    |    |
---------------------------------------------------------


2.  Parsing the given input string using the above table


 Enter the input string: abba

Stack                Input
--------------------------
$A              abba$
$aBa            abba$ 
 $aB          bba$ 
 $aBb            bba$ 
 $aB          ba$ 
 $aBb            ba$ 
 $aB          a$ 
 $a            a$ 
 $          $ 
             $ 
 SUCCESS

*/
