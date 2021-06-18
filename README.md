# kubsetup


Prerequis:

Compte AWS avec user admin
Crée une clé privé pour se connecter au VM (xxx.pem) depuis AWS

Sur un env linux: 
- Terraform setup
- AWS CLI setup
- stocker la clé privé sur .ssh/xxx.pem



dans le ficheir variable.tf changer les valeurs de :
key
keypath

pour match avec votre clef





Pour lancer le setup :

terraform init
terraform plan #pour voir ce qui va etre fais
terraform apply
