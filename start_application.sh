
echo "*************Docker running in $1 mode******************"

# Replace with your app cloned path
APPLICATION_PATH=/home/gklsan/workspace/practice
APP_ENV=$1
RUN_TYPE=$2
CROSS_ORIGIN=http://localhost:5000

#Stop the docker 
docker stop hospital_management

#Remove the docker 
docker rm hospital_management

#Build the docker 
docker build -t hospital_management -f docker/Dockerfile .

#Run the docker 
docker run -it -p 8000:8000 --rm -e RAILS_ENV=$APP_ENV -e CROSS_ORIGIN=$CROSS_ORIGIN -e RACK_ENV=$APP_ENV -e RUN_TYPE=$RUN_TYPE --volume=$APPLICATION_PATH/hospital_management:/opt/hospital_management/ --volume=$APPLICATION_PATH/hospital_management_gems:/usr/local/bundle/ --name hospital_management hospital_management

echo "*************Docker End******************"