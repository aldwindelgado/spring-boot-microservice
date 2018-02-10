## Create private key
```sh
$ keytool -genkeypair -alias configkey -keyalg RSA -keysize 4096 -sigalg SHA512withRSA -keypass \$ampl3 -keystore configkey.jks -storepass \$ampl3app
```