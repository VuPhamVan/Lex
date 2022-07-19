%%
%class floatToDouble
%standalone
%line
%column


// delim  =	[ \t]
// ws 	   =	{delim}+
// letter = 	[a-zA-Z]
// float = float
// word   =	{letter}+

%%
float { System.out.printf("%s", "double"); }
. { System.out.printf("%s", yytext()); }
\n { System.out.println(); }