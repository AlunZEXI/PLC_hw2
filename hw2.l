//token counting code:

//initialize the counting number n
%{
#include<stdio.h>
#include<string.h>
int n = 0;
}%

// rules

%%
// keywords adding & print current info 
"while"|"if"|"else" {n++; printf("\t keywords : %s", yytext);}
// keywords adding & print current info 
“int” | “float” {n++; printf(“\t keywords : %s”, yytext);}
// identifiers adding & print current info 
[a-z A-Z_][a-z A-Z 0-9_]*{n++; printf(“\t identifiers : %s”, yytext);}
// operators adding & print current info 
“+” | “-” | “*” | “++” | “=” | “==” | “<=”{n++; printf(“\t operators: %s”, yytext);}
// separators adding & print current info 
[() {} , ; |]{n++; printf(“\t separators : %s”, yytext);}
// floats adding & print current info 
[0-9] * “.” [0-9]+ {n++; printf(“\t floats : %s”, yytext);}
// integers adding & print current info 
[0-9]+ {n++; printf(“\t integers : %s”, yytext);}
%%

int totalTokens(){}//to wrap the above rule
int main()
{
	//to get file input
	FILE *fp;
	char fileName[100];
	printf("Please input your file name: \n");
  //count the number of tokens
	scanf("%s",fileName);
	fp = fopen(fileName,"r");
	yyin = fp;
	yylex();
	printf("\n The overall number of the tokens: %d\n", n);
	return 0;
}
