%%
%class nomalize
%standalone
%line
%column


delim  =	[ \t]
ws 	   =	{delim}+
// letter = 	[a-zA-Z]
// word   =	{letter}+

%%
{ws} { System.out.printf("%s", " "); }
. { System.out.printf("%s", yytext()); }