/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function validarn(e){
    var teclado=(document.all)?e.keyCode:e.which;
    if(teclado===8)return true;

    var patron=/[0-9\d .]/;

    var prueba=String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarRegistro(formulario){
    //validar longitud 
    if(formulario.nombre.value.length < 3){
        alert("Por favor escribe tres carácteres o más en tu nombre");
        formulario.nombre.focus();
        return false;
    }

    //validar longitud apellido 
    if(formulario.appat.value.length < 3){
        alert("Por favor escribe tres carácteres o más en tu apellido paterno");
        formulario.appat.focus();
        return false;
    }

    //validar longitud apellido 
    if(formulario.apmat.value.length < 3){
        alert("Por favor escribe tres carácteres o más en tu apellido materno");
        formulario.apmat.focus();
        return false;
    }
    
    //obtencion de datos   
    var checkOk="QWERTYUIOPASDFGHJKLÑZXCVBNM+"+"qwertyuiopasdfghjklñzxcvbnm"+" ";
    var checkNombre=formulario.nombre.value;
    var checkAppat=formulario.appat.value;
    var checkApmat=formulario.apmat.value;
    var allValid=true;
    
    
    
    //validar 
    for(var i=0; i<checkNombre.length;i++){
        var ch=checkNombre.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    if(!allValid){
        alert("Escribe solo letras en tu nombre");
        formulario.nombre.focus();
        return false;
    }

    //validar apellido 
    for(var i=0; i<checkAppat.length;i++){
        var ch=checkAppat.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    if(!allValid){
        alert("Escribe solo letras en tu apellido paterno");
        formulario.appat.focus();
        return false;
    }

    //validar apellido 
    for(var i=0; i<checkApmat.length;i++){
        var ch=checkApmat.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    if(!allValid){
        alert("Escribe solo letras en tu apellido materno");
        formulario.apmat.focus();
        return false;
    }
    
    //validar edad
    var checkOk="1234567890";
    var checkEdad=formulario.edad.value;
    var allValid=true;
    
    for(var i=0; i<checkEdad.length;i++){
        var ch=checkEdad.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    
    if(checkEdad<0 || checkEdad>122){
        alert("Ingresa una edad válida");
        return false;
    }
    
     //validar 
   
}
