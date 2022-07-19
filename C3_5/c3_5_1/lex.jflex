%%
%class tokenizer
%standalone
%line
%column

%{
    enum Token {
        LT, LE, EQ, NE, GT, GE, IF, THEN, ELSE, ID, NUMBER, RELOP, WHILE, STRING,
    } 
    int yylval=-3;
%}

%{
    int installID() {
        System.out.println(yytext());
        return -1;
    }    

    int installNum() {
        System.out.println(yytext());
        return -2;
    }

    int installString() {
        System.out.println(yytext());
        return -4;
    }
%}

%eof{
    System.out.println("yylex:" + yylval);
%eof}

delim  =	[ \t]
ws 	   =	{delim}+
letter = 	[a-zA-Z]
digit  =    [0-9]
id     =    {letter}({letter}|{digit}|_)*
number =    {digit}+(\.{digit}+)?(E[+-]?{digit }+)?
string =    \"(\\[nrtbf\\\"\']|[^\\\"\']*)*\"

%%

{ws} {}
if   {yylval = Token.valueOf("IF").ordinal(); return (Token.valueOf("IF").ordinal()); }
while {yylval = Token.valueOf("WHILE").ordinal();  return (Token.valueOf("WHILE").ordinal()); }
then {yylval = Token.valueOf("THEN").ordinal(); return (Token.valueOf("THEN").ordinal()); }
else {yylval = Token.valueOf("ELSE").ordinal(); return (Token.valueOf("ELSE").ordinal()) ; }
{id} {yylval = (int) installID(); return (Token.valueOf("ID").ordinal()); }
{string} { yylval = (int) installString(); return (Token.valueOf("STRING").ordinal()); }
{number} {yylval = (int) installNum(); return (Token.valueOf("NUMBER").ordinal()); }
"<" {yylval = Token.valueOf("LT").ordinal(); return (Token.valueOf("RELOP").ordinal()); }
"<=" {yylval = Token.valueOf("LE").ordinal(); return (Token.valueOf("RELOP").ordinal());}
"==" {yylval = Token.valueOf("EQ").ordinal(); return (Token.valueOf("RELOP").ordinal()); }
"!=" {yylval = Token.valueOf("NE").ordinal(); return (Token.valueOf("RELOP").ordinal() ); }
">" {yylval = Token.valueOf("GT").ordinal(); return (Token.valueOf("RELOP").ordinal()); }
">=" {yylval = Token.valueOf("GE").ordinal(); return (Token.valueOf("RELOP").ordinal()); }