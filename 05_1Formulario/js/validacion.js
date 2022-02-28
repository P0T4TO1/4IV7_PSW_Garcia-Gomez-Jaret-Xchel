/*
Javascript es un lenguaje con paradigma orientado a objetos
y funciones, por tal motivo presenta una particularidad:

NO TIPADO

no existe int, float, string, ni char, ni nada

TODO ES VAR => variable

De acuerdo al estandar ES6 se manejan tres tipos de 
variables:

VAR
LET es una variable de tipo "protected"
CONST

*/

function validar(formulario){
    //obtener los datos y DISCRIMINAR a los que tienes 3 letras
    if(formulario.nombre.value.length < 5){
        alert("Escriba por lo menos 5 caracteres en el campo nombre")
        formulario.nombre.focus();
        return false;
    }

    var checkOk = "qwertyuiopasdfghjklñzxcvbnm" + "QWERTYUIOPASDFGHJKLÑZXCVBNM";

    var checkStr = formulario.nombre.value;

    var todoesvalido = true;

    for(var i=0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);

        for(var j=0; j < checkOk.length; j++){
            if(ch == checkOk.charAt(j)){
                break;
            }
        }
        if(j==checkOk.length){
            todoesvalido=false;
            break;
        }
    }

    if(!todoesvalido){
        alert("Escriba unicamente letras en el campo Nombre");
        formulario.nombre.focus();
        return false;
    }

    var checkOk = "123467890";

    var checkStr = formulario.edad.value;

    var todoesvalido = true;

    for(var i=0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);

        for(var j=0; j < checkOk.length; j++){
            if(ch == checkOk.charAt(j)){
                break;
            }
        }
        if(j==checkOk.length){
            todoesvalido=false;
            break;
        }
    }

    if(!todoesvalido){
        alert("Escriba unicamente numeros en el campo Edad");
        formulario.edad.focus();
        return false;
    }

    var txt = formulario.email.value;
    //creo mi expresion regular

    var b = /^[^@^\s]+[^@.\s]+(\.[^@\.\s]+)+$/;

    alert("Email" + (b.test(txt)?" ":" no ")+"valido");
    return b.test;

}