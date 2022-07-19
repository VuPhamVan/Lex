%%
%class PigLatin
%standalone
%line
%column

%{
    boolean starts_vowel(String c){
	    switch(c.charAt(0)){
            case 'a':
            case 'e':
            case 'i':
            case 'o':
            case 'u':
            case 'A':
            case 'E':
            case 'I':
            case 'O':
            case 'U':
                return true;
            default:
                return false;
 	}
}
%}


delim  =	[ \t]
ws 	   =	{delim}+
letter = 	[a-zA-Z]
word   =	{letter}+

%%
{ws} { System.out.printf("%s", yytext()); }
{word} { 
	if (starts_vowel(yytext())) 
		System.out.printf("%say", yytext());
	else
		System.out.printf("%s%cay", yytext().substring(1), yytext().charAt(0));}
. { System.out.printf("%s", yytext()); }