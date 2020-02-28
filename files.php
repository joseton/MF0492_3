<?php

//empieza el show de maruan
if(isset($_REQUEST["op"])){
  // me llega el parametro
  $operacion=$_REQUEST["op"];
//op es
}
else{

  echo"no le has dado a ningun boton";
}

switch ($operacion) {
  case 'calcular':
      calcular();
      break;
    case 'añadir':
      añadir();
      break;
      case 'quitar':
        quitar();
        break;
  default:
      $uri=dirname($_SERVER['PHP_SELF']);
      //$uri.="/facturacion/facturacion.php";
      header("Location: $uri");
      die;
    break;
}
function añadir(){


}
function quitar(){


}
function calcular(){
  //recoger los checkbox
  $calculo="";
  $campos=$_REQUEST["num_campos"];
  $suma=0;
  $media=0;
  $max=0;
  $min=0;
  for ($i=1; $i < $campos; $i++) {

      $suma+=$_REQUEST['campo'.$i];
        if($max<=$_REQUEST['campo'.$i]){
          $max=$_REQUEST['campo'.$i];
        }
        if($min>=$_REQUEST['campo'.$i]){
          $min=$_REQUEST['campo'.$i];
        }
      }

  $media=$suma/$campos;

    if(isset($_REQUEST['suma'])){
        $calculo.="la suma es -> ".$suma;

    }
  if(isset($_REQUEST['media'])){
    $calculo.="<br>la media es -> ".$media;

  }
  if(isset($_REQUEST['maximo'])){
    $calculo.="<br>el maximo es -> ".$max;

  }
  if(isset($_REQUEST['minimo'])){
    $calculo.="<br>el minimo es -> ".$min;

  }
  echo $calculo;
}
