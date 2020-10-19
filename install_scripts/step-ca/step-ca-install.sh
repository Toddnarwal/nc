
# setup step-ca server
docker pull smallstep/step-ca
docker volume create step
docker run -it -v step:/home/step smallstep/step-ca sh
$ step ca init
✔ What would you like to name your new PKI?: Smallstep
✔ What DNS names or IP addresses would you like to add to your new CA? localhost
✔ What address will your new CA listen at?: :9000
✔ What would you like to name the first provisioner for your new CA?: admin
✔ What do you want your password to be?: <your password here>
$ echo <your password here> > /home/step/secrets/password

docker run -d -p 127.0.0.1:9000:9000 -v step:/home/step smallstep/step-ca

# Configure local step-cli 
step ca bootstrap --ca-url https://localhost:9000 --install --fingerprint f9e45ae9ec5d42d702ce39fd9f3125372ce54d0b29a5ff3016b31d9b887a61a4

# test
curl https://localhost:9000/health

# create certs
step ca certificate localhost localhost.crt localhost.key
