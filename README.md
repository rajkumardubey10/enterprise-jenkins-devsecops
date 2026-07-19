# 🚀 Enterprise DevSecOps Jenkins CI Pipeline

![Java](https://img.shields.io/badge/Java-17-blue)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-green)
![Jenkins](https://img.shields.io/badge/Jenkins-CI-red)
![Maven](https://img.shields.io/badge/Maven-3.9-orange)
![SonarQube](https://img.shields.io/badge/SonarQube-Code_Quality-brightgreen)
![Nexus](https://img.shields.io/badge/Nexus-Repository-blueviolet)
![Trivy](https://img.shields.io/badge/Trivy-Security-blue)
![GPG](https://img.shields.io/badge/GPG-Signed-success)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

> An enterprise-grade DevSecOps CI Pipeline for Java Spring Boot applications using Jenkins, Maven, SonarQube, Gitleaks, GPG, Trivy SBOM Scan, and Nexus Repository Manager.

---
## Pipeline Architecture 

<img width="1774" height="887" alt="Image" src="https://github.com/user-attachments/assets/8d9b1723-74b9-4fbc-81a6-e54ef7f8200d" />

## 📌 Project Status

> **Current Phase:** CI Pipeline Completed ✅

### Completed

- ✅ Git Checkout
- ✅ Secret Scanning (Gitleaks)
- ✅ Maven Build
- ✅ Unit Testing
- ✅ JaCoCo Code Coverage
- ✅ GPG Artifact Signing
- ✅ CycloneDX SBOM Generation
- ✅ SonarQube Static Code Analysis
- ✅ Sonar Quality Gate Validation
- ✅ Trivy SBOM Vulnerability Scan
- ✅ Publish Signed Artifact to Nexus

### Upcoming

- ⏳ Docker Image Build
- ⏳ Docker Image Scan (Trivy)
- ⏳ Cosign Image Signing
- ⏳ Push Docker Image to Registry
- ⏳ Kubernetes Deployment
- ⏳ Health Check
- ⏳ Smoke Test
- ⏳ GitOps using ArgoCD
- ⏳ Rollback Strategy
- ⏳ Slack Notification

---

# 📖 Project Overview

This project demonstrates how an enterprise DevSecOps CI pipeline is implemented for a Java Spring Boot application.

The pipeline integrates multiple security, quality, and artifact management tools to ensure that every code change is verified before deployment.

The objective of this project is to simulate a real enterprise CI workflow where security and quality checks are enforced before artifacts are published.

---

# 🏗 CI Pipeline Architecture

```text
Developer
     │
     ▼
 GitHub Repository
     │
     ▼
 Jenkins Pipeline
     │
 ├── Git Checkout
 ├── Secret Scan (Gitleaks)
 ├── Build & Unit Test
 ├── GPG Artifact Signing
 ├── SonarQube Analysis
 ├── Quality Gate
 ├── CycloneDX SBOM
 ├── Trivy SBOM Scan
 └── Publish Artifact to Nexus
```

---

# 🛠 Technology Stack

| Category | Tools |
|-----------|-------|
| CI/CD | Jenkins |
| Build Tool | Maven Wrapper |
| Language | Java 17 |
| Framework | Spring Boot |
| Code Quality | SonarQube |
| Code Coverage | JaCoCo |
| Secret Detection | Gitleaks |
| SBOM | CycloneDX Maven Plugin |
| Vulnerability Scan | Trivy |
| Artifact Signing | GPG |
| Artifact Repository | Sonatype Nexus |
| Source Control | GitHub |

---

# 🔄 Jenkins Pipeline Flow

```text
Git Checkout
      │
      ▼
Secret Scan (Gitleaks)
      │
      ▼
Prepare Build
      │
      ▼
Build, Test & Sign
      │
      ▼
SonarQube Analysis
      │
      ▼
Quality Gate
      │
      ▼
Trivy SBOM Scan
      │
      ▼
Publish Artifact to Nexus
```

---

# 📷 Jenkins Pipeline Execution

<img width="1366" height="768" alt="CI_Pipeline_stage" src="https://github.com/user-attachments/assets/5fe3760d-102e-419c-84d9-7a609e0003ce" />

The pipeline executes multiple quality and security gates before publishing artifacts into Nexus Repository.

Stages included:

- Git Checkout
- Secret Scan
- Build & Test
- GPG Signing
- SonarQube Analysis
- Quality Gate
- Trivy SBOM Scan
- Nexus Deployment

---

# 🔐 Secret Scanning

The pipeline performs secret scanning using **Gitleaks** before the application is built.

It detects accidentally committed

- AWS Keys
- API Keys
- Passwords
- Tokens
- Private Keys

If any secret is detected, the pipeline fails immediately.

---

# ⚙ Build, Test & GPG Signing

The Maven Wrapper performs

- Project Compilation
- Unit Testing
- JaCoCo Code Coverage
- SBOM Generation
- Artifact Signing using GPG

All generated Maven artifacts are digitally signed before publishing.

---

# 📊 SonarQube Code Quality Analysis

<img width="1366" height="768" alt="petclinic-qualitygate" src="https://github.com/user-attachments/assets/1ecc6e60-cd48-4214-bf16-187c8edc671c" />

SonarQube performs static code analysis and validates the project against the configured Quality Gate.

### Checks Performed

- Bugs
- Vulnerabilities
- Security Hotspots
- Code Smells
- Reliability
- Maintainability
- Test Coverage

---

# ✅ Sonar Quality Gate

The Jenkins pipeline waits until SonarQube finishes the analysis.

If the Quality Gate fails, the pipeline is stopped automatically and artifact publishing is prevented.

This ensures that only high-quality code is published.

---

# 📦 CycloneDX SBOM Generation

During the Maven build, a Software Bill of Materials (SBOM) is generated using the CycloneDX Maven Plugin.

The generated SBOM contains all application dependencies and their versions.

---

# 🛡 Trivy SBOM Vulnerability Scan

Instead of scanning only the source code, Trivy scans the generated CycloneDX SBOM.

This allows early detection of

- Known CVEs
- Vulnerable dependencies
- Security issues in third-party libraries

---

# 📦 Publish Artifact to Nexus Repository

<img width="1366" height="768" alt="nexus-snapshot-artifactory" src="https://github.com/user-attachments/assets/79d5b03f-da54-4cf9-bfcc-b0b2aa662070" />


After all security and quality checks pass successfully, Jenkins publishes the signed Maven artifacts into Sonatype Nexus Repository Manager.

Uploaded artifacts include

- JAR
- POM
- CycloneDX SBOM
- GPG Signature
- SHA1
- MD5
- Maven Metadata

---

# ⚙ Maven Distribution Management

<img width="1366" height="768" alt="artifacts-upload-config-screenshot" src="https://github.com/user-attachments/assets/1bfe9329-05cd-4e66-b70c-7850cc11f8fa" />

The project uses Maven Distribution Management to automatically publish artifacts into the appropriate Nexus repository.

```xml
<distributionManagement>

    <repository>
        <id>maven-releases</id>
        <url>http://localhost:8081/repository/maven-releases/</url>
    </repository>

    <snapshotRepository>
        <id>maven-snapshots</id>
        <url>http://localhost:8081/repository/maven-snapshots/</url>
    </snapshotRepository>

</distributionManagement>
```

---

# 🔑 Jenkins Managed Maven Settings

<img width="1366" height="768" alt="Nexus-connect-cred-screenshot" src="https://github.com/user-attachments/assets/27084721-52c4-4cd8-8c31-c61e7ef70e8c" />

Instead of storing Nexus credentials inside the project, Jenkins injects them dynamically using the Config File Provider Plugin.

Configured repositories

- maven-releases
- maven-snapshots

This approach keeps credentials outside the source code.

---

# 🔒 Jenkins Credentials

<img width="1366" height="768" alt="Image" src="https://github.com/user-attachments/assets/21f58ca8-5365-43c3-af93-ddc16c3acbfa" />

The following credentials are securely stored inside Jenkins.

| Credential | Purpose |
|------------|----------|
| GitHub Token | Repository Checkout |
| Nexus Credentials | Artifact Upload |
| Sonar Token | Sonar Authentication |
| GPG Private Key | Artifact Signing |
| GPG Passphrase | GPG Unlock |
| GPG Key ID | Signing Identity |

---

# ✅ Build Summary

| Stage | Status |
|---------|--------|
| Git Checkout | ✅ |
| Secret Scan | ✅ |
| Build | ✅ |
| Unit Test | ✅ |
| JaCoCo Coverage | ✅ |
| GPG Signing | ✅ |
| SonarQube Analysis | ✅ |
| Quality Gate | ✅ |
| CycloneDX SBOM | ✅ |
| Trivy SBOM Scan | ✅ |
| Publish to Nexus | ✅ |

---

# 💡 Challenges Solved

During the implementation of this project, several enterprise CI/CD issues were encountered and resolved.

### Maven GPG Signing

Configured Jenkins to securely import private keys and sign Maven artifacts.

---

### Nexus Authentication

Integrated Jenkins Config File Provider Plugin with Maven.

Resolved

- Server ID mismatch
- Maven settings configuration
- Jenkins credential mapping
- Environment variable naming issue (`-` vs `_`)

---

### SonarQube Quality Gate

Integrated Jenkins with SonarQube and configured the pipeline to stop automatically whenever the Quality Gate fails.

---

# 🚀 Future Enhancements

The next phase of this project will extend the CI pipeline into a complete enterprise CI/CD pipeline.

- Docker Image Build
- Docker Image SBOM
- Trivy Image Scan
- Cosign Image Signing
- Push Image to Docker Registry
- Kubernetes Deployment
- Readiness & Liveness Probes
- Health Check
- Smoke Test
- GitOps Deployment using ArgoCD
- Automatic Rollback
- Slack Notifications

---

# 📚 Key Learning Outcomes

- Enterprise Jenkins Pipeline Design
- Secure Credential Management
- Maven Artifact Signing
- SonarQube Quality Gates
- Software Bill of Materials (SBOM)
- Dependency Vulnerability Scanning
- Nexus Artifact Repository
- DevSecOps Best Practices

---

# 👨‍💻 Author

**Rajkumar Dubey**

GitHub: https://github.com/rajkumardubey10

---

⭐ If you found this project useful, consider giving it a Star.


# Spring PetClinic Sample Application [![Build Status](https://github.com/spring-projects/spring-petclinic/actions/workflows/maven-build.yml/badge.svg)](https://github.com/spring-projects/spring-petclinic/actions/workflows/maven-build.yml)[![Build Status](https://github.com/spring-projects/spring-petclinic/actions/workflows/gradle-build.yml/badge.svg)](https://github.com/spring-projects/spring-petclinic/actions/workflows/gradle-build.yml)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/spring-projects/spring-petclinic) [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=7517918)

## Understanding the Spring Petclinic application with a few diagrams

See the presentation here:  
[Spring Petclinic Sample Application (legacy slides)](https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application?slide=20)

> **Note:** These slides refer to a legacy, pre–Spring Boot version of Petclinic and may not reflect the current Spring Boot–based implementation.  
> For up-to-date information, please refer to this repository and its documentation.


## Run Petclinic locally

Spring Petclinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/) or [Gradle](https://spring.io/guides/gs/gradle/).
Java 17 or later is required for the build, and the application can run with Java 17 or newer.

You first need to clone the project locally:

```bash
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
```
If you are using Maven, you can start the application on the command-line as follows:

```bash
./mvnw spring-boot:run
```
With Gradle, the command is as follows:

```bash
./gradlew bootRun
```

You can then access the Petclinic at <http://localhost:8080/>.

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

You can, of course, run Petclinic in your favorite IDE.
See below for more details.

## Building a Container

There is no `Dockerfile` in this project. You can build a container image (if you have a docker daemon) using the Spring Boot build plugin:

## Running the Container Image

```bash
./mvnw spring-boot:build-image
docker images | grep petclinic
docker run -p 8080:8080 docker.io/library/spring-petclinic:latest
```

## In case you find a bug/suggested improvement for Spring Petclinic

Our issue tracker is available [here](https://github.com/spring-projects/spring-petclinic/issues).

## Database configuration

In its default configuration, Petclinic uses an in-memory database (H2) which
gets populated at startup with data. The h2 console is exposed at `http://localhost:8080/h2-console`,
and it is possible to inspect the content of the database using the `jdbc:h2:mem:<uuid>` URL. The UUID is printed at startup to the console.

A similar setup is provided for MySQL and PostgreSQL if a persistent database configuration is needed. Note that whenever the database type changes, the app needs to run with a different profile: `spring.profiles.active=mysql` for MySQL or `spring.profiles.active=postgres` for PostgreSQL. See the [Spring Boot documentation](https://docs.spring.io/spring-boot/how-to/properties-and-configuration.html#howto.properties-and-configuration.set-active-spring-profiles) for more detail on how to set the active profile.

You can start MySQL or PostgreSQL locally with whatever installer works for your OS or use docker:

```bash
docker run -e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:9.7
```

or

```bash
docker run -e POSTGRES_USER=petclinic -e POSTGRES_PASSWORD=petclinic -e POSTGRES_DB=petclinic -p 5432:5432 postgres:18.4
```

Further documentation is provided for [MySQL](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/resources/db/mysql/petclinic_db_setup_mysql.txt)
and [PostgreSQL](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/resources/db/postgres/petclinic_db_setup_postgres.txt).

Instead of vanilla `docker` you can also use the provided `docker-compose.yml` file to start the database containers. Each one has a service named after the Spring profile:

```bash
docker compose up mysql
```

or

```bash
docker compose up postgres
```

## Test Applications

At development time we recommend you use the test applications set up as `main()` methods in `PetClinicIntegrationTests` (using the default H2 database and also adding Spring Boot Devtools), `MySqlTestApplication` and `PostgresIntegrationTests`. These are set up so that you can run the apps in your IDE to get fast feedback and also run the same classes as integration tests against the respective database. The MySql integration tests use Testcontainers to start the database in a Docker container, and the Postgres tests use Docker Compose to do the same thing.

## Compiling the CSS

There is a `petclinic.css` in `src/main/resources/static/resources/css`. It was generated from the `petclinic.scss` source, combined with the [Bootstrap](https://getbootstrap.com/) library. If you make changes to the `scss`, or upgrade Bootstrap, you will need to re-compile the CSS resources using the Maven profile "css", i.e. `./mvnw package -P css`. There is no build profile for Gradle to compile the CSS.

## Working with Petclinic in your IDE

### Prerequisites

The following items should be installed in your system:

- Java 17 or newer (full JDK, not a JRE)
- [Git command line tool](https://help.github.com/articles/set-up-git)
- Your preferred IDE
  - Eclipse with the m2e plugin. Note: when m2e is available, there is a m2 icon in `Help -> About` dialog. If m2e is
  not there, follow the installation process [here](https://www.eclipse.org/m2e/)
  - [Spring Tools Suite](https://spring.io/tools) (STS)
  - [IntelliJ IDEA](https://www.jetbrains.com/idea/)
  - [VS Code](https://code.visualstudio.com)

### Steps

1. On the command line run:

    ```bash
    git clone https://github.com/spring-projects/spring-petclinic.git
    ```

1. Inside Eclipse or STS:

    Open the project via `File -> Import -> Maven -> Existing Maven project`, then select the root directory of the cloned repo.

    Then either build on the command line `./mvnw generate-resources` or use the Eclipse launcher (right-click on project and `Run As -> Maven install`) to generate the CSS. Run the application's main method by right-clicking on it and choosing `Run As -> Java Application`.

1. Inside IntelliJ IDEA:

    In the main menu, choose `File -> Open` and select the Petclinic [pom.xml](pom.xml). Click on the `Open` button.

    - CSS files are generated from the Maven build. You can build them on the command line `./mvnw generate-resources` or right-click on the `spring-petclinic` project then `Maven -> Generates sources and Update Folders`.

    - A run configuration named `PetClinicApplication` should have been created for you if you're using a recent Ultimate version. Otherwise, run the application by right-clicking on the `PetClinicApplication` main class and choosing `Run 'PetClinicApplication'`.

1. Navigate to the Petclinic

    Visit [http://localhost:8080](http://localhost:8080) in your browser.

## Looking for something in particular?

|Spring Boot Configuration | Class or Java property files  |
|--------------------------|---|
|The Main Class | [PetClinicApplication](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java) |
|Properties Files | [application.properties](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/resources) |
|Caching | [CacheConfiguration](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/java/org/springframework/samples/petclinic/system/CacheConfiguration.java) |

## Interesting Spring Petclinic branches and forks

The Spring Petclinic "main" branch in the [spring-projects](https://github.com/spring-projects/spring-petclinic)
GitHub org is the "canonical" implementation based on Spring Boot and Thymeleaf. There are
[quite a few forks](https://spring-petclinic.github.io/docs/forks.html) in the GitHub org
[spring-petclinic](https://github.com/spring-petclinic). If you are interested in using a different technology stack to implement the Pet Clinic, please join the community there.

## Interaction with other open-source projects

One of the best parts about working on the Spring Petclinic application is that we have the opportunity to work in direct contact with many Open Source projects. We found bugs/suggested improvements on various topics such as Spring, Spring Data, Bean Validation and even Eclipse! In many cases, they've been fixed/implemented in just a few days.
Here is a list of them:

| Name | Issue |
|------|-------|
| Spring JDBC: simplify usage of NamedParameterJdbcTemplate | [SPR-10256](https://github.com/spring-projects/spring-framework/issues/14889) and [SPR-10257](https://github.com/spring-projects/spring-framework/issues/14890) |
| Bean Validation / Hibernate Validator: simplify Maven dependencies and backward compatibility |[HV-790](https://hibernate.atlassian.net/browse/HV-790) and [HV-792](https://hibernate.atlassian.net/browse/HV-792) |
| Spring Data: provide more flexibility when working with JPQL queries | [DATAJPA-292](https://github.com/spring-projects/spring-data-jpa/issues/704) |

## Contributing

The [issue tracker](https://github.com/spring-projects/spring-petclinic/issues) is the preferred channel for bug reports, feature requests and submitting pull requests.

For pull requests, editor preferences are available in the [editor config](.editorconfig) for easy use in common text editors. Read more and download plugins at <https://editorconfig.org>. All commits must include a __Signed-off-by__ trailer at the end of each commit message to indicate that the contributor agrees to the Developer Certificate of Origin.
For additional details, please refer to the blog post [Hello DCO, Goodbye CLA: Simplifying Contributions to Spring](https://spring.io/blog/2025/01/06/hello-dco-goodbye-cla-simplifying-contributions-to-spring).

## License

The Spring PetClinic sample application is released under version 2.0 of the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).



