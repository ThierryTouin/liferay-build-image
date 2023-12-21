#!/bin/bash
cd ./sources/glowroot
mvn clean install 
cp ./liferay-glowroot/target/liferay-glowroot-1.0.0.jar ../../resources-images/liferay/binaries/module-un/target
mvn clean
cd ../..
