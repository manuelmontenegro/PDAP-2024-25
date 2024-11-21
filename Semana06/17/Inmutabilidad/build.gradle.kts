plugins {
    id("java")
}

group = "es.ucm"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")
    implementation("org.immutables:value:2.10.1")
    annotationProcessor("org.immutables:value:2.10.1")
}


tasks.test {
    useJUnitPlatform()
}