%%
%class SQL
%standalone
%line
%column

%{
    enum KEYWORD {
        WHILE, FROM, SELECT, ID,
    }    

    int yylval;

    int installID() {
        System.out.println(yytext().toLowerCase());
        return -1;
    }
%}

// delim  =	[ \t]
// ws 	   =	{delim}+
letter = 	[a-zA-Z]
digit  =    [0-9]
// word   =	{letter}+
while  =	[wW][hH][iI][lL][eE]

from   =	[fF][rR][oO][mM]
select =	[sS][eE][lL][eE][cC][tT]
id	   =    {letter}({letter}|{digit})*

%%

{from} 		{ System.out.println("FROM KEYWORD"); return (KEYWORD.valueOf("FROM").ordinal()); }
{while} 	{ System.out.println("WHILE KEYWORD"); return (KEYWORD.valueOf("WHILE").ordinal()); }
{select}	{ System.out.println("SELECT KEYWORD"); return (KEYWORD.valueOf("SELECT").ordinal()); }
{id}		{ System.out.println("ID"); yylval = (int) installID(); return (KEYWORD.valueOf("ID").ordinal()); }	