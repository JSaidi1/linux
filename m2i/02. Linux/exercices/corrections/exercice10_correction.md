# Exercice 10 - Swap

Ecrire un script bash permettant d'échanger les valeurs de 2 variables a et b.

### Exemples

```bash
a=5
b=10
---- Après swap
a=10
b=5
```

### Corrections

```bash
#!/bin/bash

echo "Veuillez entrer a : "
read a
echo "Veuillez entrer b : "
read b

echo "Valeur de a : $a, valeur de b: $b"
# Version 1 : avec var tmp
# c=$a # c= 5
# a=$b # a= 10
# b=$c # b= 5

# Version 2 :
a=$((a + b)) 
b=$((a - b))
a=$((a - b))

echo "Valeur de a : $a, valeur de b: $b"
```