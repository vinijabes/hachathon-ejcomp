function setURL(url){
	localURL = url;
}

function twoDigits(d) {		
    if(0 <= d && d < 10) return "0" + d.toString();
    if(-10 < d && d < 0) return "-0" + (-1*d).toString();
    return d.toString();
}

Date.prototype.toMysqlFormat = function() {
    return this.getFullYear() + "-" + twoDigits(1 + this.getMonth()) + "-" + twoDigits(this.getDate()) + " " + twoDigits(this.getHours()) + ":" + twoDigits(this.getMinutes()) + ":" + twoDigits(this.getSeconds());
};

function normalize(entrada){
	if(entrada.length % 3 != 0);
		if(entrada.length%3 == 1){
			entrada = entrada + entrada[0] + entrada[1];
		}
		if(entrada.length%3 == 2){
			entrada = entrada + entrada[0];
		}
	return entrada;
}

function criptografa(entrada){
	Semente = Math.floor((Math.random() * 9999600) + 100);
	Semente = normalize(Semente.toString());
	stringSaida = "";
	for(i = 0, j = 0; i < entrada.length; i++, j++){
		if(j*3 + 3 == Semente.length)
			j = 0;

		if(i%2 == 0){
			stringSaida += entrada.charCodeAt(i) + (parseInt(Semente.substring(j*3, (j+1)*3)))%500 + 200;
		}else{
			stringSaida += parseInt((Semente.substring(j*3, (j+1)*3)))%500+200 - entrada.charCodeAt(i);
		}
	}
	saida = {'semente': Semente, 'string':stringSaida};

	return saida;
}

function descriptografa(entrada){
	Semente = entrada['semente'];
	sizeSemente = entrada['semente'].toString().length;
	stringSaida = "";

	for(i = 0, j = 0, k = 0; i <= entrada['string'].length - 3; i += 3, j++, k++){
		if(k*3 + 3 == Semente.length)
			k = 0;
		if(j%2 == 0){
			stringSaida += String.fromCharCode(parseInt(entrada['string'].substring(i,i + 3))- (parseInt(Semente.substring(k*3, (k+1)*3)))%500 - 200);
		}else{
			stringSaida += String.fromCharCode(-(parseInt(entrada['string'].substring(i,i + 3))- (parseInt(Semente.substring(k*3, (k+1)*3)))%500- 200));
		}
	}
	return stringSaida;
}

setInterval(function(){
	if(navigator.onLine && typeof(localURL) !== 'undefined'){
		sincroniza();
	}

	if(localStorage.getItem('activity')){
		if(descriptografa(JSON.parse(localStorage.getItem("activity"))) < Date.now({timezone:'America/Sao_Paulo'}))
			localStorage.setItem('activity', JSON.stringify(criptografa(Date.now({timezone:'America/Sao_Paulo'}).toString())));
	}
	else{
		localStorage.setItem('activity', JSON.stringify(criptografa(Date.now({timezone:'America/Sao_Paulo'}).toString())));
	}
}, 3000);

function criaBuffer(){
	buffer = {'membros_nomes':[{'value':43, 'label':"José"}]}
	localStorage.setItem("buffer", JSON.stringify(buffer));
}

function sincroniza(){
	registros = localStorage.getItem("registros");
	if(registros != ''){
		$.ajax({
			method: "POST",
			url:localURL,
			data: {dados:registros},
			dataType: 'json',
			success : function(dados)
			{
				if(dados.result == 'sincronizado')
					localStorage.setItem('registros', '');
			},
			error : function(){
			}
		});
	}
	criaBuffer();
	location.reload();
}

function registra(){
	if(localStorage.getItem("registros") != ''){
		registros = JSON.parse(localStorage.getItem("registros"));
		for(var registro in registros){
			if(registros[registro].id_membro == 43 && registros[registro].saida == ''){
				registros[registro].saida = criptografa(new Date().toMysqlFormat());
				localStorage.setItem("registros", JSON.stringify(registros));
				return;
			}		
			console.log(registros[registro]);

		}
	}{registros = false;}

	if(registros)registros[registros.length] = {'id_membro':43, 'entrada':criptografa(new Date().toMysqlFormat()), 'saida':''};
	else{
		registros = [{'id_membro':43, 'entrada':criptografa(new Date().toMysqlFormat()), 'saida':''}];
	}
	localStorage.setItem("registros", JSON.stringify(registros));
}

console.log(descriptografa(criptografa("FON")));
//registra();
$(document).ready(function(){
	$( "#id_membro" ).autocomplete({
	  source: JSON.parse(localStorage.getItem('buffer'))
	});

	$.ajax({
        dataType: "json",
        type : 'post',
        data:{value: $("#nome").val()},
        url: "presenca/auto_complete/"+$("#id_membro").val(),
        success: function(data) {
            $('#nome').removeClass('ui-autocomplete-loading');  
			$.map( data, function(dados) {
                return{
                label:dados.label,
                value:dados.value
            };

                // your operation on data
            }, data)
			localStorage.setItem("buffer", JSON.stringify(data));
        },
        error: function(data) {
            $('#nome').removeClass('ui-autocomplete-loading');  
        }
    });
});