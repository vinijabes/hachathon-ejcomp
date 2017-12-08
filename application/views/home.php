<div class="homebody">

	<div class="page-header">
		<h1>DVORA <small>sistema de gerenciamento empresarial</small></h1>
	</div>

	<?php if(isset($_SESSION['logado']) && $_SESSION['logado']){ ?>
	<img id="dvora" src="<?= base_url('assets/imagens/d-vora.png') ?>" alt="DVORA">
	<div class="col-md-12">
		<?php
		if(count($current) != 0){
			echo heading("Ocorrendo agora:",3);

			foreach($current as $now){
				echo "<div class='col-md-6'>";
				echo '<div class="panel panel-dvora">';
				echo '<div class="panel-heading">'.heading($now->descricao,3)."<p align='center' id='time'></p></div>";
				echo '<div class="panel-body">';
				echo '<div class="col-md-6">'.heading("<i class='fa fa-clock-o' aria-hidden='true'></i> Início: ".$now->inicio,5)."</div>";
				echo '<div class="col-md-6">'.heading("<i class='fa fa-clock-o' aria-hidden='true'></i> Fim: ".$now->final,5)."</div>";
				echo '<div class="col-md-12">';
				echo '<label><i class="fa fa-user" aria-hidden="true"> </i>  Membros selecionados</label>';
				if($members[0] != null){	
					foreach($members as $m){
						echo "<li align='left'>".$m->nome." ".$m->chegada."</li>";
					}
				}else{
					echo "<br>Nenhum membro foi selecionado.";
				}
				echo '</div><div class="col-md-12"><br>';
				echo '<input type="hidden" id="final" value="'.$now->final.'">';
				echo anchor(base_url("presenca/cadastrar"), "Inserir presença", array('class'=>'btn btn-dvora')).'</div>';
				echo '</div>';
				echo '</div>';
			}
		}else{
			echo heading("Nenhum evento ocorrendo agora.",3);
		}
		?>
	</div>	


	<div class="col-md-12">
		<?php
		if(count($eventos) != 0){
			echo heading("Próximos eventos:",3);
			$contador = 0;
			foreach($eventos as $evento){
				echo "<div class='col-md-4 caixa-produto'>";
				echo '<div class="panel panel-dvora">';
				echo '<div class="panel-heading">'.heading($evento->descricao,3).heading(date("d/m/Y", strtotime($evento->data)),5).'</div><br>';
				echo '<div class="col-md-6">'.heading("<i class='fa fa-clock-o' aria-hidden='true'></i> Início: ".$evento->inicio,5)."</div>";
				echo '<div class="col-md-6">'.heading("<i class='fa fa-clock-o' aria-hidden='true'></i> Fim: ".$evento->final,5)."</div>";
				echo '<div class="panel-body">'.anchor(base_url("evento/detalhes/".$evento->id_evento), "Ver detalhes", array('class'=>'btn btn-dvora')).'</div>';
				echo '</div>';
				echo "</div>";
				$contador++;
				if($contador%3==0){
					echo "</div><div class='row-fluid'>";
				}
			}
		}
		?>
	</div>


	<?php } ?>

	<?php if(!isset($_SESSION['logado']) || !$_SESSION['logado']){ ?>


	<img src="<?= base_url('assets/imagens/d-vora.png') ?>" alt="DVORA">

	<?php } ?>