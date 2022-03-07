function algoritmo()
{
    let n;

    let valor_automovil, cuota_total, periodo_pago, cuota_inicial;

    valor_automovil = parseFloat (document.formulario1.valor_automovil.value);

    periodo_pago = parseFloat (document.formulario1.periodo_pago.value);
    
    cuota_inicial = parseFloat (document.formulario1.cuota_inicial.value);

    cuota_total=valor_automovil*Math.pow(1.0+cuota_inicial/100/365,periodo_pago*7);

    document.formulario1.cuota_total.value = cuota_total;
}