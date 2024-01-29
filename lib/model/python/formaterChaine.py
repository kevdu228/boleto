def formater(chaine):
    newChaine=''
    nouveau=''
    print(chaine.split(','))
    for mot in chaine:
        if mot != ',':
            nouveau = nouveau+mot
        else:
            nouveau = "\'"+nouveau+"\'"
            nouveau = nouveau + mot
        
        newChaine = nouveau
   
    return newChaine
# this is the new edit
print(formater('$nom, $prenom, $password, $email, $reference, $dateNaissance, $dateCreation, $etat, $gcu, $ville, $pays, $adresse, $telephone, $photoProfil, $photoBack, $titreRole, $about'))