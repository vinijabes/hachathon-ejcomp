<p id="searchresults">
	<?php
	//Toma no cu hein pietro
	$url = "http://localhost/ejcomp";
	// PHP5 Implementation - uses MySQLi.
	// mysqli('localhost', 'yourUsername', 'yourPassword', 'yourDatabase');
	$db = new mysqli('200.145.184.146', 'dvora-ejcomp', 'KVdGqGJioKTA8zWn', 'dvora-ejcomp');
	
	if(!$db) {
		// Show error if we cannot connect.
		echo 'ERROR: Não foi possível conectar ao banco de dados.';
	} else {
		// Is there a posted query string?
		if(isset($_POST['queryString'])) {
			$queryString = $db->real_escape_string($_POST['queryString']);
			
			// Is the string length greater than 0?
			if(strlen($queryString) >0) {
				$query = $db->query("SELECT * FROM membro WHERE nome LIKE '%" . $queryString . "%' ORDER BY nome LIMIT 8");
				
				if($query) {
					
					echo '<span class="category">Membros</span>';
					while ($result = $query ->fetch_object()) {	      
						echo '<a href="'.$url.'/membro/ver/'.$result->id_membro.'">';
						echo '<img src="'.$url.'/assets/imagens/'.$result->foto.'" alt="" />';
						$name = $result->nome;
						$iso88591 = $name; // file must be ISO-8859-1 encoded
						$utf8_1 = utf8_encode($iso88591);
						$utf8_2 = iconv('ISO-8859-1', 'UTF-8', $iso88591);
						$utf8_2 = mb_convert_encoding($iso88591, 'UTF-8', 'ISO-8859-1');
						$name = $utf8_2;
						if(strlen($name) > 35) { 
							$name = substr($name, 0, 35) . "...";
						}	         			
						echo '<span class="searchheading">'.$name.'</span></a>';
					}
					echo '<span class="seperator"><a> </a></span>';
				} else {
					echo 'ERRO: Há um problema na query.';
				}
			} else {
				// Dont do anything.
			} // There is a queryString.
		} else {
			echo 'Você não pode acessar diretamente esse script!';
		}
	}
	?>
</p>