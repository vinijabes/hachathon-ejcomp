<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/* VALIDADOR - REGRA
* flag: Referente ao tipo de validação aplicado sobre a regra
* regra: ['URI' //Referente a URI que sera aplicado a regra
*		  'segmento' => METODO //Referente ao segmento na URI Controller/Metodo/dado. DEFAULT: METODO(2)
*		  'redirect' => bool //Referente a se o controller deve redirecionar caso a regra não seja cumprida. DEFAULT: TRUE
*		  'redirect_url' => url//Referente a url para que será redirecionado caso a regra não seja cumprida. DEFAULT: home
*         '...' => ... //Dependendo da flag novos parâmetros serão necessários
*			]
* Definição: public function AdicionaRegra($regra, $flag);
*				$regra: array();
*				$flag: INT;
*			 public function AdicionaRegras($regras, $flags);
*				$regras: array($regra);
*				$flags: array($flag);
*			 OBS: Caso o número de flags seja inferior ao de regras, as flags irão se repetindo conforme todas sejam usadas.
*
* Como usar: $this->AdicionaRegra(['cadastrar', 'permissao'=>'Novo Usuario', 'redirect_url'=>'Usuarios'], PERMISSAO_URI);
*			 	['regra' => ['cadastrar', 'permissao'=>'Novo Usuario', 'redirect_url'=>'Usuarios', 'segmento' => METODO 
*				'redirect' => 1], 'flag' => PERMISSAO_URI];
*
*			 $this->AdicionaRegras(['cadastrar', 'permissao'=>'Novo Usuario', 'redirect_url'=>'Usuarios'],
*							   	   ['altera', 'permissao'=>'Alterar Usuario', 'redirect_url'=>'Usuarios'], [PERMISSAO_URI]);
*				[ 0 => ['regra' => ['cadastrar', 'permissao'=>'Novo Usuario', 'redirect_url'=>'Usuarios', 'segmento' => METODO 
*				'redirect' => 1], 'flag' => PERMISSAO_URI]
*				  1 => ['regra' => ['altera', 'permissao'=>'Alterar Usuario', 'redirect_url'=>'Usuarios', 'segmento' => METODO 
*				'redirect' => 1], 'flag' => PERMISSAO_URI]];
*
* VALIDADOR - Valida
* Definição: public function Valida($precisaTodasPermissoes);
*			 	$precisaTodasPermissoes: bool; // Caso faça uso de permissoes verifica se é necessário que se tenha todas para 					  * 			   		acessar o controller, caso falso permitira que o controller seja acessado se o usuário tiver pelo menos    					 *			 		   uma permissão. DEFAULT: TRUE
* Como usar: $this->Valida();
*/


define('PERMISSAO_URI', 1, TRUE);//EX: [] = ['regra' => ['cadastro','permissao'=>'Insere Presença', 'segmento'=>2, 'redirect' => TRUE, 'redirect_url'=>'Usuarios'], 'flag' => 'PERMISSAO_URI']
define('URI_NAO_LOGADO', 2, TRUE); //EX: [] = ['regra' => ['cadastro', 'segmento'=>2, 'redirect' => TRUE, 'redirect_url'=>'Usuarios'], 'flag' => 'URI_NAO_LOGADO']
define('AJAX_REQUEST', 3, TRUE);//EX: [] = ['regra'=>['cadastro', 'segmento'=>2, 'redirect' => TRUE, 'redirect_url'=>'Usuarios'], 'flag' =>'AJAX_REQUEST']

//SEGMENTOS
define('CONTROLLER', 1, TRUE);
define('METODO', 2, TRUE);

class Validador extends CI_Controller {
	protected $regras; //[] = ['regra' => '', 'flag' => '']. 
	protected $permissoes;
	protected $permissoes_necessarias;
	protected $url_redirecionamento;

	/**
	 * Valida e verifica através de regras as permissões do usuário para acessar determinada página
	 * @param array   $permissoes_necessarias Permissoes que o usuário precisa para acessar 
	 *                                        a página.                                    
	 * @param array   $regras                 Regras para validar se a página pode ser acessada e se 
	 *                                        foi acessada corretamente
	 * @param boolean $valida                 Verifica se a validação deve ocorrer no construtor
	 */
	public function __construct($permissoes_necessarias = array(), $regras = array(), $valida = FALSE){
		parent::__construct(); 
		$this->load->model('auth_model', 'auth');

		$this->permissoes = $this->auth->listar_permissoes();
		$this->permissoes_necessarias = $permissoes_necessarias;
		$this->regras = $regras;
		$this->url_redirecionamento = '';
		
		if($valida)
			return $this->Valida();
	}

	/**
	 * Adiciona uma nova permissão necessária para se acessar a página.
	 * @param string $permissao Permissão necessária.
	 */
	public function AdicionaPermissaoNecessaria($permissao){
		$this->permissoes_necessarias[] = $permissao;
	}

	/**
	 * Adiciona um conjunto de novas permissões para se acessar a página
	 * @param array $permissoes Array de Permissões necessárias.
	 */
	public function AdicionaPermissoesNecessarias($permissoes){
		if(!isset($permissoes) && !is_array($permissoes))
			return false;

		foreach ($permissoes as $key => $permissao) {
			$this->AdicionaPermissaoNecessaria($permissao);
		}
	}

	/**
	 * Adiciona uma nova regra que verificara se o usuário poderá ou não ter acesso à página.
	 * @param array $regra  Regra a ser verificada
	 * @param int 	$flag  	Tipo de verificação a ser aplicado sobre a regra
	 */
	public function AdicionaRegra($regra, $flag){
		$regra[0] = strtolower($regra[0]);
		switch ($flag) {
			case PERMISSAO_URI:
			case URI_NAO_LOGADO:
			case AJAX_REQUEST:
				if(!array_key_exists('segmento', $regra))
					$regra['segmento'] = METODO;
				if(!array_key_exists('redirect', $regra))
					$regra['redirect'] = TRUE; 
				if(!array_key_exists('redirect_url', $regra) && $regra['redirect'])
					$regra['redirect_url'] = $this->url_redirecionamento;
				else
					$regra['redirect_url'] = strtolower($regra['redirect_url']);
				$this->regras[] = ['regra' => $regra, 'flag' => $flag];
				break;

			default:
				$this->regras[] = ['regra' => $regra, 'flag' => $flag];
				break;
		}
	}

	/**
	 * Adiciona um novo conjunto de regras
	 * @param array $regras Conjunto de regras a serem verificadas
	 * @param array $flags  Conjunto de tipos de regras a serem associadas as regras.
	 */
	public function AdicionaRegras($regras, $flags){
		$regrasIndex = 0;
		$flagIndex = 0;

		if(!isset($regras) && !is_array($regras) &&
			!sset($flags) && !is_array($flags))
			return false;

		while($regrasIndex < count($regras)){
			if($flagIndex >= count($flags))
				$flagIndex = 0;

			$this->AdicionaRegra($regras[$regrasIndex], $flags[$flagIndex]);

			$regrasIndex++;
			$flagIndex++;
		}
	}

	/**
	 * Verifica se o usuário tem determinada permissão
	 * @param string  $permissao   Permissao a ser verificada
	 * @param boolean $redireciona Redirecionar o usuário caso não possua a permissão
	 * @param string  $url         Url para a qual o usuário será redirecionado.
	 */
	public function TemPermissao($permissao, $redireciona = TRUE, $url = NULL){
		
		if(array_key_exists($permissao, $this->permissoes)){
			if($this->permissoes[$permissao])
				return true;
		}
		if($redireciona)
			if(is_null($url))
				redirect(base_url($this->url_redirecionamento));
			else
				redirect(base_url($url));
		else{
			return false;
		}

		return true;
	}	

	/**
	 * Verifica se o usuário tem um conjunto de permissões
	 * @param array   $permissoes  permissoes a serem verificadas
	 * @param boolean $todas       Verificar se o usuário possui todas as permissões a serem verificadas
	 * @param boolean $redireciona Redirecionar o usuário caso não possua a permissão
	 * @param string  $url         Url para a qual o usuário será redirecionado.
	 */
	public function TemPermissoes($permissoes, $todas = FALSE, $redireciona = TRUE, $url = NULL){
		$contadorPermissoes = 0;
		foreach ($permissoes as $key => $permissao) {
			if($this->TemPermissao($permissao, FALSE))
				$contadorPermissoes++;
		}

		if($todas){
			if($contadorPermissoes == count($this->permissoes_necessarias))
				return true;
		}else if($contadorPermissoes)
				return true;

		if($redireciona)
			if(is_null($url))
				redirect($this->url_redirecionamento);
			else
				redirect($url);
		else
			return false;
	}

	/**
	 * Verifica se as regras estão sendo cumpridas
	 * @param array $regras Regras que serão verificadas
	 */
	private function VerificaRegras($regras){
		$URI;
		foreach ($regras as $key => $regra) {
			if($this->IsURI($regra['regra'][0], $regra['regra']['segmento']))
				$URI = $regras[$key]['regra'][0];
		}

		if(!isset($URI))
			return false;
		
		foreach ($regras as $key => $regra) {
			if($regra['regra'][0] == $URI){
				if(!isset($regra['result']))
					if($regra['regra']['redirect']);
						redirect(base_url($regra['regra']['redirect_url']));
			}
		}
	}

	/**
	 * Verifica se o usuário está logado, se cumpre as regras e se tem as permissões necessárias
	 * @param boolean $precisaTodasPermissoes Necessidade de o usuário possuir todas as permissões
	 *                                        a serem verificadas
	 */
	public function Valida($precisaTodasPermissoes = FALSE){
		$resultPermissoes = $this->TemPermissoes($this->permissoes_necessarias, $precisaTodasPermissoes, FALSE);
		$resultLogado = $this->IsLogado();
		foreach ($this->regras as $key => $regra) {
			$rule = $regra['regra'];
			switch ($regra['flag']) {
				case URI_NAO_LOGADO:
					if($this->IsURI($rule[0], $rule['segmento'])){
						$this->regras[$key]['result'] = TRUE;
						$resultLogado = true;
					}
					break;
				case PERMISSAO_URI:
					if($this->IsURI($rule[0], $rule['segmento']) && $this->TemPermissao($rule['permissao'], FALSE)){
						$this->regras[$key]['result'] = TRUE;
					}
					break;
				case AJAX_REQUEST:
					if($this->input->is_ajax_request()){
						$this->regras[$key]['result'] = TRUE;
					}
				default:
					# code...
					break;
			}
		}

		$this->VerificaRegras($this->regras);
		if(!$resultLogado)
			return false;
		if(!$resultPermissoes)
			return false;

	}

	/**
	 * Verifica se o usuário está logado
	 */
	private function IsLogado(){
		if(isset($_SESSION['logado']) && $_SESSION['logado'])
			return true;

		return false;
	}

	/**
	 * Verifica se a pagina possui determinada URI 
	 * @param string $uri      URI a ser verificada
	 * @param int 	 $segmento Segmento em que a URI se encontra
	 */
	private function IsURI($uri, $segmento){
		if(array_key_exists(strtolower($uri), $this->uri->uri_to_assoc($segmento)))
			return true;

		return false;
	}
}
