/// ts_line([delta_sep])

/*
    delta_sep - distantion between lines, default - 0
*/


var str = '<<line#';

if argument_count>=1 // type
    str+=string(argument[0])+'|'
else
    str+='0|'
str+='>>'

return str;
