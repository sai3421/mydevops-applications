server=http://18.218.77.182:8081/artifactory
repo=medi-lab

userName=jenkins
password=Jfrog1234

# Maven artifact location
name=medilab-morning-preclinic

artifact=com/vsjit/medilab-morning-preclinic-war/$name/0.0.1-SNAPSHOT
path=$server/$repo/$artifact
echo $path

build=$(curl -u "jenkins":"Jfrog1234" $path/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/")
echo $build

extension=$(curl -u "jenkins":"Jfrog1234" $path/maven-metadata.xml | grep '<extension>' | head -2 | sed "s/.*<extension>\([^<]*\)<\/extension>.*/\2/")
echo $extension

artifact_name=$name-$build.war
echo $artifact_name

url=$path/$artifact_name

# Download
echo $url
wget  --user=$userName --password=$password $url
cp $artifact_name app-files/medilab-morning-preclinic.war
