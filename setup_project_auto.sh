#!/bin/bash

# 1️⃣ Go to Maven project folder
cd ~/MavenProjects/TrafficSignal || { echo "Project folder not found"; exit 1; }

# 2️⃣ Ensure Maven directory structure
mkdir -p src/main/java/com/traffic

# 3️⃣ Move main Java file safely
mv /c/Users/HP/Documents/OneDrive/Desktop/Java/TrafficController.java src/main/java/com/traffic/ 2>/dev/null || echo "Main file already exists"

# 4️⃣ Create or overwrite TrafficControllerTest.java
cat <<EOL > src/main/java/com/traffic/TrafficControllerTest.java
package com.traffic;

public class TrafficControllerTest {
    public static void main(String[] args) {
        System.out.println(TrafficController.getAction(TrafficController.Signal.RED));
        System.out.println(TrafficController.getAction(TrafficController.Signal.GREEN));
        System.out.println(TrafficController.getAction(TrafficController.Signal.YELLOW));
    }
}
EOL

# 5️⃣ Create pom.xml automatically with exec plugin
cat <<EOL > pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <modelVersion>4.0.0</modelVersion>

    <groupId>com.traffic</groupId>
    <artifactId>TrafficSignal</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <name>TrafficSignal</name>
    <description>Traffic Signal Maven Project</description>

    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
    </properties>

    <dependencies>
        <!-- No dependencies required -->
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>exec-maven-plugin</artifactId>
                <version>3.1.0</version>
                <configuration>
                    <mainClass>com.traffic.TrafficControllerTest</mainClass>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>
EOL

# 6️⃣ Compile and run
mvn clean compile
mvn exec:java

# 7️⃣ Initialize Git if needed
git rev-parse --is-inside-work-tree 2>/dev/null || git init

# 8️⃣ Add and commit changes
git add .
git commit -m "Setup TrafficController project" || echo "No changes to commit"

# 9️⃣ Add GitHub remote if not already present
git remote get-url origin 2>/dev/null || git remote add origin https://github.com/Satyam2145/MavenProject.git

# 🔟 Set main branch and push
git branch -M main
git push -u origin main

# 1️⃣1️⃣ Show paths to pom.xml and jar files
echo "pom.xml path:"
find ~/MavenProjects/TrafficSignal -name "pom.xml"
echo "Compiled .jar path(s):"
find ~/MavenProjects/TrafficSignal/target -name "*.jar"

