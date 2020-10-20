
# Setup step-ca server
# First container (tempory) note the "Root fingerprint" after completing "step ca init"
docker pull smallstep/step-ca
docker volume create step
docker run -it -v step:/home/step smallstep/step-ca sh
$ step ca init
✔ What would you like to name your new PKI?: Smallstep
✔ What DNS names or IP addresses would you like to add to your new CA? localhost
✔ What address will your new CA listen at?: :9999
✔ What would you like to name the first provisioner for your new CA?: admin
✔ What do you want your password to be?: <your password here>
$ echo <your password here> > /home/step/secrets/password

# Second container
docker run -d --name step-ca -p 127.0.0.1:9999:9999 -v step:/home/step smallstep/step-ca
# Configure local step-cli on the host (not the container)
wget https://github.com/smallstep/cli/releases/download/v0.15.2/step-cli_0.15.2_amd64.deb 
sudo dpkg -i step-cli_0.15.2_amd64.deb 
# Use the root fingerprint from the first container in the following command
step ca bootstrap --ca-url https://localhost:9999 --install --fingerprint 0123456789012345678901234567890123456789012345678901234567890123

# test
curl https://localhost:9000/health

# create certs
step ca certificate localhost localhost.crt localhost.key
