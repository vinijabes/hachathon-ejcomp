<div class="nav-side-menu">
  <div class="brand">EJcomp</div>
  <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
  
  <div class="menu-list">

    <ul id="menu-content" class="menu-content collapse out">

      <?php  if(isset($_SESSION['logado']) && $_SESSION['logado']){  ?>
      <li>
        <a href="<?= base_url() ?>">
          <i class="fa fa-home fa-lg"></i> Início
        </a>
      </li>
      <li>
        <a href="<?= base_url() ?>">
          <i class="fa fa-cogs" aria-hidden="true"></i> Configuração
       </a>
     </li>
     <?php  if($tem_permissao['Ver Eventos'] || $tem_permissao['Novo Evento']){ ?>

     <li data-toggle="collapse" data-target="#service" class="collapsed">
      <a href="#"><i class="fa fa-calendar fa-lg"></i> Evento <span class="arrow"></span></a>
    </li>  
    <ul class="sub-menu collapse" id="service">
      <?php  if($tem_permissao['Ver Eventos']){?>
      <a href="<?= base_url("evento/listar") ?>"><li>Ver eventos</li></a>
      <?php }
      if($tem_permissao['Novo Evento']){ ?>
      <a href="<?= base_url("evento/cadastrar") ?>"><li>Novo evento</li></a>
      <?php } ?>
    </ul>
    <?php } ?>

    <?php  if($tem_permissao['Ver Membros'] || $tem_permissao['Novo Membro']){ ?>
    <li data-toggle="collapse" data-target="#new" class="collapsed">
      <a href="#"><i class="fa fa-users fa-lg"></i> Membro <span class="arrow"></span></a>
    </li>
    <ul class="sub-menu collapse" id="new">
      <?php  if($tem_permissao['Ver Membros']){ ?>
      <a href="<?= base_url("membro/listar") ?>"><li>Ver membros</li></a>
      <?php } ?>
      <?php  if($tem_permissao['Novo Membro']){ ?>        
      <a href="<?= base_url("membro/cadastrar") ?>"><li>Novo membro</li></a>
      <?php } ?>
    </ul>
    <?php } ?>

    <?php  if($tem_permissao['Ver Equipamentos'] || $tem_permissao['Novo Equipamento'] || $tem_permissao['Devolver Equipamento'] || $tem_permissao['Baixa Equipamento']){ ?>
    <li data-toggle="collapse" data-target="#equipamento" class="collapsed">
      <a href="#"><i class="fa fa-laptop fa-lg"></i> Equipamento<span class="arrow"></span></a>
    </li>  
    <ul class="sub-menu collapse" id="equipamento">
      <?php  if($tem_permissao['Ver Equipamentos']){?>
      <a href="<?= base_url("equipamento/listar") ?>"><li>Ver equipamentos</li></a>
      <?php }
      if($tem_permissao['Novo Equipamento']){ ?>
      <a href="<?= base_url("equipamento/cadastrar") ?>"><li>Novo equipamento</li></a>
      <?php }
      if($tem_permissao['Devolver Equipamento']){ ?>
      <a href="<?= base_url("equipamento/devolver") ?>"><li>Devolver equipamento</li></a>
      <?php }
      if($tem_permissao['Baixa Equipamento']){ ?>
      <a href="<?= base_url("equipamento/baixa") ?>"><li>Dar baixa</li></a>
      <?php } ?>
    </ul>
    <?php } ?>


    <?php  if($tem_permissao['Ver Usuarios'] || $tem_permissao['Novo Usuario']){ ?>
    <li data-toggle="collapse" data-target="#new_user" class="collapsed">
      <a href="#"><i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> Usuário <span class="arrow"></span></a>
    </li>
    <ul class="sub-menu collapse" id="new_user">
      <?php  if($tem_permissao['Ver Usuarios']){ ?>
      <a href="<?= base_url("usuarios") ?>"><li>Ver usuários</li></a>
      <?php } ?>
      <?php  if($tem_permissao['Novo Usuario']){ ?>        
      <a href="<?= base_url("usuarios/cadastrar") ?>"><li>Novo usuário</li></a>
      <?php } ?>
    </ul>
    <?php } ?>


    <?php  if( TRUE ){ ?>
    <li data-toggle="collapse" data-target="#financeiro" class="collapsed">
      <a href="#"><i class="fa fa-usd fa-lg" aria-hidden="true"></i> Financeiro <span class="arrow"></span></a>
    </li>  
    <ul class="sub-menu collapse" id="financeiro">
      <?php  if( TRUE ){?>
      <a href="<?= base_url() ?>"><li>Minhas finanças</li></a>
      <?php }
      if( TRUE ){ ?>
      <a href="<?= base_url() ?>"><li>Adicionar verba</li></a>
      <?php } 
      if( TRUE ){ ?>
      <a href="<?= base_url() ?>"><li>Adicionar gasto</li></a>
      <?php } ?>
    </ul>
    <?php } ?>

    <?php  if( TRUE ){ ?>
    <li data-toggle="collapse" data-target="#cliente" class="collapsed">
      <a href="#"><i class="fa fa-handshake-o fa-lg" aria-hidden="true"></i> Cliente <span class="arrow"></span></a>
    </li>  
    <ul class="sub-menu collapse" id="cliente">
      <?php  if( TRUE ){?>
      <a href="<?= base_url() ?>"><li>Meus clientes</li></a>
      <?php }
      if( TRUE ){ ?>
      <a href="<?= base_url() ?>"><li>Novo cliente</li></a>
      <?php } ?>
    </ul>
    <?php } ?>

    <?php  if( TRUE ){ ?>
    <li data-toggle="collapse" data-target="#documentos" class="collapsed">
      <a href="#"><i class="fa fa-folder-open-o fa-lg" aria-hidden="true"></i> Documento <span class="arrow"></span></a>
    </li>  
    <ul class="sub-menu collapse" id="documentos">
      <?php  if( TRUE ){?>
      <a href="<?= base_url() ?>"><li>Meus documentos</li></a>
      <?php }
      if( TRUE ){ ?>
      <a href="<?= base_url() ?>"><li>Novo documento</li></a>
      <?php } ?>
    </ul>
    <?php } ?>

    <?php  if( TRUE ){ ?>
    <li data-toggle="collapse" data-target="#diretoria" class="collapsed">
      <a href="#"><i class="fa fa-rocket fa-lg" aria-hidden="true"></i> Diretoria <span class="arrow"></span></a>
    </li>  
    <ul class="sub-menu collapse" id="diretoria">
      <?php  if( TRUE ){?>
      <a href="<?= base_url('diretoria/') ?>"><li>Ver Diretoria</li></a>
      <?php }
      if( TRUE ){ ?>
      <a href="<?= base_url('diretoria/cadastrar') ?>"><li>Nova Diretoria</li></a>
      <?php } ?>
    </ul>
    <?php } ?>


    <?php  if($tem_permissao['Inserir Presença']){ ?>        
    <li>
      <a href="<?= base_url('Presenca/cadastrar/') ?>">
        <i class="fa fa-barcode fa-lg"></i> Inserir presença
      </a>
    </li>
    <?php } ?>

    <?php }//Fecha se tá logado ?> 
    <?php
    if(!isset($_SESSION['logado']) || !$_SESSION['logado']){
      ?>
      <form method="POST" action="<?= base_url('Login/entrar/') ?>" class="col-md-8 col-md-offset-2">
        <label>Usuário</label>
        <input type="text" class="form-control" name="usuario">
        <label>Senha</label>
        <input type="password" class="form-control" name="senha"><br>
        <input type="submit" value="Entrar" name="logar" class="btn btn-dvora-inverse">
      </form>
      <?php 
      if(isset($_SESSION['invalido']) && $_SESSION['invalido']){
        echo '<div class="col-md-12">';
        echo "
        <script>

        swal(
          'Falha!',
          'Login e/ou senha inválidos!',
          'warning'
        )
        </script>

        ";
        echo '</div>';
      }
    }else{
      echo '<li>';
      echo  '<a href="'.base_url('Login/sair/').'">';
      echo    '<i class="fa fa-power-off fa-lg"></i> Desconectar';
      echo  '</a>';
      echo '</li>';
    } 
    ?>


  </ul>
</div>
</div>