
<?php
 

$json = file_get_contents('php://input');
include'db2.php';
$data = $_POST;

$result["statut"]= false;
$result["msg"]='';

$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

//get datas
$id =  $data['id'];
$nom =  $data['nom'];
$prenom =  $data['prenom'];
$password =  $data['password'];
$email =  $data['email'];
$reference =  $data['reference'];
$dateNaissance = new DateTime( $data['dateNaissance']);
$dateCreation = new DateTime( $data['dateCreation']);
$etat = isset($data['etat']) ? ( $data['etat']) === '1' : false;
$gcu = isset($data['gcu']) ? ( $data['gcu']) === '1' : false;
$ville =  $data['ville'];
$pays =  $data['pays'];
$adresse =  $data['adresse'];
$telephone =  $data['telephone'];
$photoProfil =  $data['photoProfil'];
$photoBack =  $data['photoBack'];
$titreRole =  $data['titreRole'];
$about =  $data['about'];



//check if user not exit before insert

$test = $db->prepare(" SELECT *
 FROM users where telephoneuser = '$telephone' and etat = 1 ");

$test ->execute();
  $length = $test->rowCount();

 if ($length>0) {
 	$result["msg"] = "Ce numero existe deja";
 	
 	echo json_encode($result);
 }else{

	
$stmt = $db->prepare(
    "INSERT INTO users (nomuser, prenomuser, passworduser, emailuser, referanceuser, datenaisseuser, datecreateuser, etatuser, gcuuser, villeuser, paysuser, adresseuser, telephoneuser, photoprofiluser, photobackuser, titrerole, aboutuser)
    VALUES (:nom, :prenom, :password, :email, :reference, :dateNaissance, :dateCreation, :etat, :gcu, :ville, :pays, :adresse, :telephone, :photoProfil, :photoBack, :titreRole, :about)");


$stmt->bindParam(':nom', $nom);
$stmt->bindParam(':prenom', $prenom);
$stmt->bindParam(':password', $password);
$stmt->bindParam(':email', $email);
$stmt->bindParam(':reference', $reference);
$stmt->bindParam(':dateNaissance', $dateNaissance->format('Y-m-d H:i:s'));
$stmt->bindParam(':dateCreation', $dateCreation->format('Y-m-d H:i:s'));
$stmt->bindParam(':etat', $etat, PDO::PARAM_INT);
$stmt->bindParam(':gcu', $gcu, PDO::PARAM_INT);
$stmt->bindParam(':ville', $ville);
$stmt->bindParam(':pays', $pays);
$stmt->bindParam(':adresse', $adresse);
$stmt->bindParam(':telephone', $telephone);
$stmt->bindParam(':photoProfil', $photoProfil);
$stmt->bindParam(':photoBack', $photoBack);
$stmt->bindParam(':titreRole', $titreRole);
$stmt->bindParam(':about', $about);
$stmt->execute();

$result["statut"]=true;

echo json_encode($result ,JSON_UNESCAPED_UNICODE);

 }
 



  
 


?>