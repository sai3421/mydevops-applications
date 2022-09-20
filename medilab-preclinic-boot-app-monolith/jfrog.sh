server=http://18.217.176.126:8081/artifactory
repo=libs-snapshot-local

userName=admin
password=Jfrog1234

# Maven artifact location
name=medilab-morning-preclinic-war
artifact=com/vsjit/medilab-morning-preclinic-war/0.0.1-SNAPSHOT
path=$server/$repo/$artifact

echo $path
build=$(curl -u "admin":"Jfrog1234" $path/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/")
echo $build

#extension=$(curl -u "admin":"Jfrog1234" $path/maven-metadata.xml | grep '<extension>' | head -2 | sed "s/.*<extension>\([^<]*\)<\/extension>.*/\2/")
#echo $extension

artifact_name=$name-$build.war
echo $artifact_name

url=$path/$artifact_name

# Download
echo "!!!!!!!!!!!!!!!!"
echo $url
wget  --user=$userName --password=$password $url
mv $artifact_name medilab-morning-preclinic.war
