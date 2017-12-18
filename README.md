Repoet inneholder to tomme elm-apper som deler kode. `integrated/` inneholder en app som skal kjøres integrert i Gosys, `standalone/` inneholder en app som skal linkes til fra Gosys, men som skal kjøres for seg selv. `common/` inneholder kode som deles av applikasjonene.

# Installasjon

1. Installer [node](https://nodejs.org/en/)
2. Installer `create-elm-app`, på følgende måte:

```
npm install create-elm-app -g
```

# Kjøring

I enten `integrated/` eller `standalone/` kjør følgende kommando:

```
elm-app start
```
