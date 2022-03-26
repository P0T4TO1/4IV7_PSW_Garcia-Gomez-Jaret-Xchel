

// Problema 3

function problema3(){
    // Definir un alfabeto
    var alfabeto = ['A','B','C','D','E','F','G','H','I','J','K','L','M',
                    'Ñ','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    
    // Obtener la cadena del input y separar por comas
    
    var p3_input = document.querySelector('#p3-input').value;

    var p3_palabras = p3_input.split(',');

    // Eliminar el espacio que hay entre cada palabra
    p3_palabras = p3_palabras.map(function (palabra){
        return palabra.replace(/\s/g, '').toUpperCase();
    });

    // Calcular lo caracteres unicos de cada palabra

    var p3_res = '';

    // Iterar en cada palabra

    p3_palabras.forEach(function (palabra, i) {
        // Separar las palabras en un array para leer cada letra  
        var letras_unicas = [];
        var palabra_array = palabra.split('');
        // Iterar el alfabeto

        alfabeto.forEach(function (letra, j){
            // Iterar por palabra
            palabra_array.forEach(function (letra_palabra, k){
                // Comprobar que la letra esta dentro del alfabeto
                if(letra_palabra == letra){ 
                    // Si la letra no la hemos contado, la agragamos aun array para contar las letras unicas
                    if(letras_unicas.indexOf(letra)<0){
                        letras_unicas.push(letra);
                    }
                }    
            });
        });
        p3_res += 'Palabra: ' + palabra + ' = ' + letras_unicas.length + '\n';
    });

    document.querySelector('#p3-output').textContent = p3_res;
}


function problema1(){
    /*var alfabeto = ['A','B','C','D','E','F','G','H','I','J','K','L','M',
                    'Ñ','O','P','Q','R','S','T','U','V','W','X','Y','Z'];*/

    // Obtener la cadena del input y separar por espacios

    var p1_input = document.querySelector('#p1-input').value;

    var p1_palabras = p1_input.split(' ');

    // Invertir las palabras

    p1_palabras.reverse();

    document.querySelector('#p1-output').textContent = p1_palabras.join(" ");

}


function problema2(){

    var x1 = parseFloat(document.querySelector('#p2-x1').value);
    var y1 = parseFloat(document.querySelector('#p2-y1').value);

    var x2 = parseFloat(document.querySelector('#p2-x2').value);
    var y2 = parseFloat(document.querySelector('#p2-y2').value);
    
    var x3 = parseFloat(document.querySelector('#p2-x3').value);
    var y3 = parseFloat(document.querySelector('#p2-y3').value);
    
    var x4 = parseFloat(document.querySelector('#p2-x4').value);
    var y4 = parseFloat(document.querySelector('#p2-y4').value);
    
    var x5 = parseFloat(document.querySelector('#p2-x5').value);
    var y5 = parseFloat(document.querySelector('#p2-y5').value);

    /*var vector1 = [x1,x2,x3,x4,x5];
    var vector2 = [y1,y2.y3,y4,y5];*/

    var resV = (x1*y1) + (x2*y2) + (x3*y3) + (x4*y4) + (x5*y5);

    document.querySelector('#p2-output').textContent = "Resultado: " + resV;


}
