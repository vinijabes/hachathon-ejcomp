<?php defined('BASEPATH') OR exit('No direct script access allowed');

function limpar($string){
	$string = preg_replace('/[`^~\'"]/', null, iconv('UTF-8', 'ASCII//TRANSLIT',$string));
	$string = strtolower($string);
	$string = str_replace(" ", "-", $string);
	$string = str_replace("---", "-", $string);
	return $string;
}

function dataBr_to_dataMySQL($data){
	$campos = explode("/",$data);
	return date("Y-m-d",strtotime($campos[2]."/".$campos[1]."/".$campos[0]));
}

function atraso($entrada, $saida){
	$h1 = explode(":",$entrada);
	$h2 = explode(":",$saida);
	$acumulador1 = ($h1[0] * 3600) + ($h1[1] * 60) + $h1[2];
	$acumulador2 = ($h2[0] * 3600) + ($h2[1] * 60) + $h2[2];
	$resultado = $acumulador2 - $acumulador1;
	$hora_ponto = floor($resultado / 3600);
	$resultado = $resultado - ($hora_ponto * 3600);
	$min_ponto = floor($resultado / 60);
	$resultado = $resultado - ($min_ponto * 60);
	$secs_ponto = $resultado;
	$tempo = $hora_ponto."h ".$min_ponto."min";
	echo $tempo;
}