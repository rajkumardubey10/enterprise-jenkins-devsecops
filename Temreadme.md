# 🚀 Enterprise DevSecOps CI Pipeline using Jenkins | GPG | SonarQube | Nexus | SBOM | Trivy | Docker

<p align="center">

![Java](https://img.shields.io/badge/Java-17-blue?style=for-the-badge&logo=openjdk)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-4.x-success?style=for-the-badge&logo=springboot)
![Jenkins](https://img.shields.io/badge/Jenkins-CI-red?style=for-the-badge&logo=jenkins)
![Maven](https://img.shields.io/badge/Maven-3.9-orange?style=for-the-badge&logo=apachemaven)
![SonarQube](https://img.shields.io/badge/SonarQube-Code_Quality-brightgreen?style=for-the-badge&logo=sonarqube)
![Nexus](https://img.shields.io/badge/Nexus-Repository_Manager-blueviolet?style=for-the-badge&logo=sonatype)
![Trivy](https://img.shields.io/badge/Trivy-Vulnerability_Scanner-blue?style=for-the-badge)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?style=for-the-badge&logo=docker)
![GPG](https://img.shields.io/badge/GPG-Artifact_Signing-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

</p>

---

# 📖 Project Overview

This project demonstrates an **enterprise-grade two-stage DevSecOps CI pipeline** for Java Spring Boot applications using **Jenkins**.

Unlike traditional pipelines that build Docker images directly from source code, this implementation follows an **immutable artifact promotion strategy**, where only a **verified, digitally signed Maven artifact** is promoted to the containerization stage.

The pipeline integrates multiple quality, security, and software supply-chain security controls before any artifact is allowed to progress to the next stage.

The implementation closely resembles the CI workflow used in enterprise software organizations where every software artifact is validated, signed, scanned, and stored inside a centralized artifact repository before deployment.

---

# 🎯 Business Problem

Many CI pipelines follow a workflow similar to this:

```text
Source Code
      │
      ▼
Docker Build
      │
      ▼
Push Image
```

Although simple, this approach introduces several software supply-chain risks.

Examples include:

- Docker image may be built from unverified source code.
- Build environment may differ between executions.
- Artifact traceability becomes difficult.
- Security scanning happens too late.
- No cryptographic verification exists before deployment.
- Rebuilding source code may generate different binaries.

Large organizations generally separate **application build** from **containerization**.

Instead of rebuilding the application, they promote an immutable artifact through multiple security gates before creating a container image.

---

# ✅ Solution Architecture

This project implements a secure artifact promotion workflow.

```text
Developer

      │

      ▼

GitHub Repository

      │

      ▼

Jenkins CI Stage 1
(Build & Publish)

      │

      ▼

Signed Maven Artifact

      │

      ▼

Sonatype Nexus Repository

      │

      ▼

Jenkins CI Stage 2
(Container Build)

      │

      ▼

Verified Docker Image
```

Only artifacts that successfully pass every quality and security gate are promoted to the next stage.

---

# 🚀 Key Features

✅ Two-stage Jenkins Pipeline

✅ Immutable Artifact Promotion

✅ Maven Build Automation

✅ Unit Testing

✅ JaCoCo Code Coverage

✅ GPG Artifact Signing

✅ SonarQube Static Code Analysis

✅ Sonar Quality Gate Enforcement

✅ CycloneDX SBOM Generation

✅ Trivy SBOM Vulnerability Scan

✅ Sonatype Nexus Repository Integration

✅ Maven Snapshot Metadata Resolution

✅ Automatic Artifact Metadata Capture

✅ Automatic Stage 2 Trigger

✅ Signed Artifact Download

✅ GPG Signature Verification

✅ Docker Image Build

---

# 🏗 Enterprise Pipeline Architecture

> **Replace this section with your first architecture diagram.**

```markdown
![Pipeline Architecture](YOUR_ARCHITECTURE_IMAGE_LINK)
```

---

# 🔄 Complete Enterprise Pipeline Flow

```text
                     Developer

                         │

                         ▼

                  GitHub Repository

                         │

                         ▼

═══════════════════════════════════════════════════════
            Jenkins CI Pipeline - Stage 1
═══════════════════════════════════════════════════════

Git Checkout

        │

        ▼

Import GPG Key

        │

        ▼

Secret Scan (Gitleaks)

        │

        ▼

Build Application

        │

        ▼

Unit Tests

        │

        ▼

JaCoCo Coverage

        │

        ▼

GPG Artifact Signing

        │

        ▼

SonarQube Analysis

        │

        ▼

Quality Gate Validation

        │

        ▼

CycloneDX SBOM Generation

        │

        ▼

Trivy SBOM Scan

        │

        ▼

Publish Signed Artifact to Nexus

        │

        ▼

Capture Artifact Metadata

        │

        ▼

Trigger Stage 2

═══════════════════════════════════════════════════════
            Jenkins CI Pipeline - Stage 2
═══════════════════════════════════════════════════════

Read Artifact Metadata

        │

        ▼

Download Signed Artifact

        │

        ▼

Verify GPG Signature

        │

        ▼

Prepare Docker Context

        │

        ▼

Docker Image Build

        │

        ▼

(Image Security Pipeline)

        │

        ▼

Push Container Registry

        │

        ▼

Kubernetes Deployment
```

---

# 📦 Current Project Status

## ✅ Completed

- Git Checkout
- Import GPG Key
- Secret Scan (Gitleaks)
- Maven Build
- Unit Testing
- JaCoCo Code Coverage
- GPG Artifact Signing
- SonarQube Analysis
- Sonar Quality Gate
- CycloneDX SBOM Generation
- Trivy SBOM Vulnerability Scan
- Publish Signed Artifact to Nexus
- Capture Artifact Metadata
- Automatic Stage 2 Trigger
- Download Signed Artifact from Nexus
- Verify GPG Signature
- Docker Image Build

---

## 🚧 In Progress

- Image SBOM Generation
- Trivy Image Scan
- Docker Bench Security Scan
- Docker Image Push
- Cosign Image Signing
- Cosign Signature Verification

---

## 🎯 Planned

- Kubernetes Deployment
- Health Checks
- Smoke Testing
- GitOps using ArgoCD
- Automatic Rollback
- Slack Notifications

---

# 🛠 Technology Stack

| Category | Technology |
|------------|------------|
| Language | Java 17 |
| Framework | Spring Boot |
| Build Tool | Maven Wrapper |
| CI/CD | Jenkins |
| Source Control | GitHub |
| Secret Scanning | Gitleaks |
| Code Quality | SonarQube |
| Code Coverage | JaCoCo |
| SBOM Generation | CycloneDX Maven Plugin |
| Vulnerability Scanner | Trivy |
| Artifact Signing | GPG |
| Artifact Repository | Sonatype Nexus Repository Manager |
| Containerization | Docker |
| Image Signing *(Upcoming)* | Cosign |
| Deployment *(Upcoming)* | Kubernetes |
| GitOps *(Upcoming)* | ArgoCD |

---

# 📂 Repository Structure

```text
enterprise-jenkins-devsecops/

│

├── Jenkins/

│     ├── CI_stage_1_build_publish.jenkinsfile

│     └── CI_stage_2_containerbuild.jenkinsfile

│

├── src/

│

├── Dockerfile

├── pom.xml

├── mvnw

├── README.md

└── docker-compose.yml
```

---

# 🎯 Enterprise Design Goals

This implementation focuses on several software supply-chain security principles.

- Build Once, Promote Everywhere
- Immutable Artifact Promotion
- Shift Left Security
- Quality Gates before Release
- Cryptographic Artifact Signing
- Software Bill of Materials (SBOM)
- Artifact Traceability
- Secure Credential Management
- Enterprise Release Workflow

---


# 🚀 Stage 1 – Build, Security Validation & Artifact Publishing

The first pipeline is responsible for building the application, performing security and quality validation, digitally signing the generated artifacts, generating a Software Bill of Materials (SBOM), scanning dependencies for vulnerabilities, publishing the signed artifacts to Nexus Repository Manager, and automatically triggering the second pipeline.

Unlike traditional CI pipelines that immediately build Docker images, this pipeline first creates a **trusted software artifact**.

Only verified artifacts are promoted to the next stage.

---

# 🏗 Stage 1 Pipeline Flow

```text
Git Checkout
      │
      ▼
Import GPG Key
      │
      ▼
Secret Scan (Gitleaks)
      │
      ▼
Prepare Build
      │
      ▼
Build + Unit Test
      │
      ▼
JaCoCo Coverage
      │
      ▼
GPG Artifact Signing
      │
      ▼
SonarQube Analysis
      │
      ▼
Quality Gate
      │
      ▼
CycloneDX SBOM Generation
      │
      ▼
Trivy SBOM Scan
      │
      ▼
Publish Signed Artifact to Nexus
      │
      ▼
Capture Artifact Metadata
      │
      ▼
Trigger Stage 2
```

---

# 📸 Stage 1 Jenkins Pipeline

> Replace with your Stage 1 pipeline screenshot.

```markdown
![Stage 1 Pipeline](YOUR_STAGE1_PIPELINE_SCREENSHOT)
```

The pipeline consists of multiple security and quality gates.

Each stage must pass successfully before the artifact is published to Nexus Repository Manager.

---

# 📂 Git Checkout

The pipeline begins by securely cloning the application source code from GitHub using Jenkins-managed credentials.

### Purpose

- Retrieve latest source code
- Ensure reproducible builds
- Authenticate securely using GitHub Token

---

# 🔑 Import GPG Private Key

Before building the project, Jenkins imports the organization's private GPG key.

The private key is never stored inside the Git repository.

Instead, it is securely injected from Jenkins Credentials.

### Benefits

- Secure key management
- Artifact authenticity
- Prevents unauthorized artifact publication

---

# 🔐 Secret Scanning (Gitleaks)

Before compiling the application, the repository is scanned for accidentally committed secrets.

This follows the **Shift Left Security** principle by detecting sensitive information at the earliest stage.

### Detects

- AWS Access Keys
- GitHub Tokens
- API Keys
- Passwords
- SSH Keys
- Private Keys
- Database Credentials

If any secret is detected, the build fails immediately.

---

# ⚙ Prepare Build Environment

The Maven Wrapper (`mvnw`) is made executable before starting the build.

```bash
chmod +x mvnw
```

Using Maven Wrapper ensures every build uses the same Maven version without requiring manual installation.

---

# 🛠 Build, Test & Sign

The project is built using Maven Wrapper.

During this stage Jenkins performs multiple operations.

## Build Steps

- Dependency Resolution
- Source Compilation
- Unit Testing
- Package Creation
- JaCoCo Coverage Collection
- CycloneDX SBOM Generation
- GPG Artifact Signing

The generated JAR file is digitally signed before it is published.

This guarantees that future pipeline stages can verify the artifact integrity.

---

# 🔏 Why GPG Signing?

Without artifact signing, anyone with repository access could potentially replace a JAR file.

Digitally signing artifacts provides:

- Integrity
- Authenticity
- Non-Repudiation
- Supply Chain Security

Only artifacts signed using the organization's private key are accepted by downstream stages.

---

# 📊 JaCoCo Code Coverage

JaCoCo generates code coverage metrics during unit test execution.

Coverage reports help teams identify:

- Untested code
- Critical business logic
- Testing quality

Although coverage does not guarantee bug-free software, it provides confidence that important application paths are being exercised.

---

# 🔎 SonarQube Static Code Analysis

After the application is successfully built, Jenkins submits the project to SonarQube.

SonarQube performs static code analysis without executing the application.

---

## Checks Performed

- Bugs
- Vulnerabilities
- Security Hotspots
- Code Smells
- Duplicated Code
- Reliability Rating
- Maintainability Rating
- Technical Debt
- Test Coverage

---

# 📸 SonarQube Dashboard

> Replace with your SonarQube Dashboard screenshot.

```markdown
![Sonar Dashboard](YOUR_SONAR_SCREENSHOT)
```

---

# ✅ Sonar Quality Gate

After analysis completes, Jenkins waits for the Quality Gate result.

If the project fails the Quality Gate,

- artifact publication is stopped
- Docker image creation is prevented
- deployment cannot continue

This prevents low-quality code from progressing further through the pipeline.

---

# 📦 CycloneDX Software Bill of Materials (SBOM)

The Maven build automatically generates a CycloneDX Software Bill of Materials.

The SBOM contains every dependency included in the application.

Examples include

- Spring Boot Libraries
- Jackson
- Hibernate
- Tomcat
- Logging Frameworks

The SBOM provides complete dependency transparency and is an important software supply-chain security practice.

---

# 🛡 Trivy SBOM Vulnerability Scan

Instead of scanning only the source code, Trivy scans the generated Software Bill of Materials.

Advantages:

- Faster than source scanning
- Detects vulnerable dependencies
- Identifies known CVEs
- Produces security reports before deployment

The build can be configured to fail automatically if critical vulnerabilities are detected.

---

# 📦 Publish Signed Artifact to Nexus Repository

After every quality and security check passes successfully, Jenkins publishes the signed artifact into Sonatype Nexus Repository Manager.

Uploaded components include:

- JAR
- POM
- GPG Signature (.asc)
- CycloneDX SBOM
- Maven Metadata
- SHA Checksums
- MD5 Checksums

This creates a centralized artifact repository that becomes the single source of truth for downstream environments.

---

# 📸 Nexus Repository

> Replace with your Nexus Repository screenshot.

```markdown
![Nexus Repository](YOUR_NEXUS_SCREENSHOT)
```

---

# 📦 Maven Distribution Management

The project uses Maven Distribution Management for automatic artifact publishing.

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

Snapshot artifacts are uploaded to the Snapshot Repository while release artifacts are published to the Release Repository.

This mirrors enterprise artifact management practices.

---

# ⚙ Jenkins Managed Maven Settings

Rather than storing credentials inside the repository, Jenkins injects the Maven `settings.xml` file at runtime using the Config File Provider Plugin.

This approach provides:

- Secure credential management
- Environment-specific configuration
- Separation of code and secrets

---

# 📸 Maven Settings Injection

> Replace with your Jenkins Config File Provider screenshot.

```markdown
![Maven Settings](YOUR_SETTINGS_SCREENSHOT)
```

---

# 📦 Capture Artifact Metadata

After publishing to Nexus, the pipeline retrieves the generated Maven Snapshot Metadata.

The metadata includes:

- Artifact Name
- Resolved Version
- Repository Name
- Download URL

Instead of using the generic `4.0.0-SNAPSHOT` version, the pipeline resolves the exact timestamped artifact version.

Example:

```text
spring-petclinic-4.0.0-20260726.171948-9.jar
```

This metadata is archived and passed to Stage 2.

This ensures that the Docker image is always built from the **exact artifact** that passed every security gate.

---

# 📸 Artifact Metadata

> Replace with your "Capture Artifact Metadata" screenshot.

```markdown
![Artifact Metadata](YOUR_METADATA_SCREENSHOT)
```

---

# 🚀 Automatic Trigger to Stage 2

Once the metadata has been captured successfully, Jenkins automatically starts the second pipeline.

Instead of rebuilding the application,

Stage 2 receives:

- Artifact Name
- Resolved Version
- Download URL

These values are passed as Jenkins build parameters.

This establishes an immutable artifact promotion workflow similar to enterprise CI/CD platforms.

---

# ✅ Stage 1 Summary

| Stage | Status |
|---------|--------|
| Git Checkout | ✅ |
| Import GPG Key | ✅ |
| Secret Scan (Gitleaks) | ✅ |
| Build | ✅ |
| Unit Test | ✅ |
| JaCoCo Coverage | ✅ |
| GPG Artifact Signing | ✅ |
| SonarQube Analysis | ✅ |
| Quality Gate | ✅ |
| CycloneDX SBOM | ✅ |
| Trivy SBOM Scan | ✅ |
| Publish Artifact to Nexus | ✅ |
| Capture Artifact Metadata | ✅ |
| Trigger Stage 2 | ✅ |

---

# 🚀 Stage 2 – Immutable Artifact Promotion & Container Build

Unlike traditional CI pipelines that rebuild the application before creating a Docker image, this project follows an **immutable artifact promotion** strategy.

The application is compiled, tested, signed, scanned, and published **only once** in Stage 1.

Stage 2 never recompiles the source code.

Instead, it downloads the **exact signed artifact** from Nexus Repository Manager, verifies its authenticity, and builds the Docker image from that trusted artifact.

This approach closely resembles enterprise software release pipelines used in financial institutions, healthcare platforms, and large software organizations.

---

# 🏗 Stage 2 Pipeline Flow

```text
Read Artifact Metadata
        │
        ▼
Download Signed Artifact
        │
        ▼
Verify GPG Signature
        │
        ▼
Prepare Docker Context
        │
        ▼
Build Docker Image
        │
        ▼
Generate Image SBOM (Upcoming)
        │
        ▼
Trivy Image Scan (Upcoming)
        │
        ▼
Push Docker Image (Upcoming)
        │
        ▼
Cosign Image Signing (Upcoming)
        │
        ▼
Kubernetes Deployment (Upcoming)
```

---

# 📸 Stage 2 Jenkins Pipeline

> Replace this section with your Stage 2 Pipeline screenshot.

```markdown
![Stage 2 Pipeline](YOUR_STAGE2_PIPELINE_SCREENSHOT)
```

---

# 📦 Why a Separate Pipeline?

Many beginner CI pipelines follow this workflow:

```text
GitHub
   │
   ▼
Build
   │
   ▼
Docker Build
```

Although this works, it has several drawbacks.

If the Docker build recompiles the application:

- a different binary could be produced
- traceability is reduced
- software supply-chain integrity is weakened
- the container image may not contain the same artifact that passed quality validation

Enterprise organizations avoid this problem by **promoting immutable artifacts**.

This project implements that same design.

---

# 📋 Read Artifact Metadata

Stage 1 stores metadata describing the published artifact.

The metadata contains:

- Artifact Name
- Resolved Maven Version
- Repository Name
- Download URL

Example:

```text
Artifact Name

spring-petclinic-4.0.0-20260726.171948-9.jar

Resolved Version

4.0.0-20260726.171948-9
```

Instead of guessing which artifact to download, Stage 2 receives this information directly from Stage 1.

This guarantees reproducible builds.

---

# 📸 Artifact Metadata

> Replace with your "Read Artifact Metadata" screenshot.

```markdown
![Artifact Metadata](YOUR_METADATA_SCREENSHOT)
```

---

# 📥 Download Signed Artifact

Using the metadata generated by Stage 1, Jenkins downloads the exact artifact from Nexus Repository Manager.

Downloaded files include:

- application JAR
- GPG Signature (.asc)

Both files are stored inside the Jenkins workspace.

This guarantees that Stage 2 always works with the same binary that successfully passed every security gate.

---

# 📸 Download Artifact

> Replace with your download artifact screenshot.

```markdown
![Download Artifact](YOUR_DOWNLOAD_SCREENSHOT)
```

---

# 🔐 Verify GPG Signature

Before the Docker image is created, Jenkins verifies the downloaded artifact.

The verification process ensures that:

- the artifact has not been modified
- the artifact originated from the trusted signing key
- the downloaded binary matches the published signature

Verification command:

```bash
gpg --verify artifact/app.jar.asc artifact/app.jar
```

A successful verification confirms that the artifact is authentic and safe to promote.

---

# 📸 GPG Verification

> Replace with your GPG verification screenshot.

```markdown
![GPG Verification](YOUR_GPG_VERIFY_SCREENSHOT)
```

---

# 🔒 Why Verify the Signature Again?

A common interview question is:

> "The artifact was already signed in Stage 1. Why verify it again?"

The answer is:

The artifact may travel through multiple systems before reaching production.

For example:

```text
Developer

      │

      ▼

Jenkins

      │

      ▼

Nexus Repository

      │

      ▼

Production Build Server

      │

      ▼

Docker Image
```

Between these systems, the artifact could potentially be:

- modified
- replaced
- corrupted
- tampered with

Signature verification ensures that only trusted artifacts continue through the release pipeline.

This is an important software supply-chain security practice.

---

# 🐳 Prepare Docker Context

After successful verification, the downloaded JAR file is copied into the Docker build context.

Workspace example:

```text
workspace/

├── Dockerfile
├── app.jar
├── artifact/
│     ├── app.jar
│     └── app.jar.asc
```

The Dockerfile builds the image directly from this verified JAR.

---

# 🐳 Build Docker Image

The Docker image is created using the verified application artifact.

Example command:

```bash
docker build \
-t rajkumardubey10/spring-petclinic:<resolved-version> \
-t rajkumardubey10/spring-petclinic:latest .
```

The pipeline automatically creates two tags.

Example:

```text
rajkumardubey10/spring-petclinic:4.0.0-20260726.171948-9

rajkumardubey10/spring-petclinic:latest
```

The image is stored locally inside the Docker Engine and becomes the input for future security scanning and deployment stages.

---

# 📸 Docker Build

> Replace with your Docker Build screenshot.

```markdown
![Docker Build](YOUR_DOCKER_BUILD_SCREENSHOT)
```

---

# 🏗 Dockerfile Design

The project uses a lightweight runtime image based on Eclipse Temurin Java 17.

The Dockerfile follows several container security best practices.

Features include:

- Lightweight JRE Base Image
- Non-Root User
- Dedicated Working Directory
- Minimal Attack Surface
- Explicit Exposed Port
- Immutable Application JAR

These practices improve container security and align with enterprise recommendations.

---

# 📦 Why Build Docker Images from Nexus Artifacts?

Instead of rebuilding source code, the Docker image is built from the artifact stored inside Nexus.

Benefits include:

✅ Build Once, Promote Everywhere

✅ Reproducible Releases

✅ Immutable Artifact Promotion

✅ Artifact Traceability

✅ Strong Software Supply Chain Security

✅ Faster Container Builds

✅ Reduced Build Variability

---

# 📈 Current Container Promotion Workflow

```text
Developer

      │

      ▼

GitHub

      │

      ▼

Jenkins Stage 1

      │

      ▼

Signed Maven Artifact

      │

      ▼

Nexus Repository

      │

      ▼

Stage 2

      │

      ▼

Download Verified Artifact

      │

      ▼

Verify GPG Signature

      │

      ▼

Docker Build

      │

      ▼

Container Registry (Upcoming)

      │

      ▼

Kubernetes (Upcoming)
```

---

# 🚀 Upcoming Container Security Stages

The remaining stages of the pipeline will further secure the container image before deployment.

Planned stages include:

- Generate Container SBOM
- Trivy Image Vulnerability Scan
- Docker Bench Security
- Push Docker Image to Docker Hub
- Cosign Image Signing
- Verify Cosign Signature
- Kubernetes Deployment
- Health Check Validation
- Smoke Testing
- GitOps Deployment using ArgoCD

---

# ✅ Stage 2 Summary

| Stage | Status |
|--------|--------|
| Read Artifact Metadata | ✅ |
| Download Signed Artifact | ✅ |
| Verify GPG Signature | ✅ |
| Prepare Docker Context | ✅ |
| Build Docker Image | ✅ |
| Image SBOM | ⏳ |
| Trivy Image Scan | ⏳ |
| Push Docker Image | ⏳ |
| Cosign Image Signing | ⏳ |
| Kubernetes Deployment | ⏳ |

---

# 🔐 Security Practices Implemented

Security is integrated throughout the pipeline rather than being treated as a final validation step. Multiple security controls are applied before an artifact is promoted to the next stage.

| Security Control | Purpose | Status |
|------------------|---------|--------|
| GitHub Token Authentication | Secure source code checkout | ✅ |
| Jenkins Credentials Store | Protect secrets and passwords | ✅ |
| Gitleaks | Detect hardcoded secrets | ✅ |
| GPG Artifact Signing | Ensure artifact authenticity | ✅ |
| GPG Signature Verification | Verify artifact integrity before Docker build | ✅ |
| SonarQube Security Analysis | Detect code vulnerabilities and security hotspots | ✅ |
| Sonar Quality Gate | Prevent low-quality code promotion | ✅ |
| CycloneDX SBOM | Software dependency transparency | ✅ |
| Trivy SBOM Scan | Detect vulnerable dependencies | ✅ |
| Immutable Artifact Promotion | Prevent rebuilding different binaries | ✅ |
| Docker Image Scan | Planned | ⏳ |
| Cosign Image Signing | Planned | ⏳ |
| Kubernetes Admission Security | Planned | ⏳ |

---

# 🔑 Secure Credential Management

One of the key objectives of this project is ensuring that **no sensitive information is stored inside the Git repository**.

Jenkins securely manages:

- GitHub Personal Access Token
- Nexus Repository Credentials
- SonarQube Authentication Token
- GPG Private Key
- GPG Passphrase
- Public Key for Verification

Credentials are injected only when required during pipeline execution using Jenkins Credentials and the Config File Provider Plugin.

This approach aligns with enterprise DevSecOps best practices by separating secrets from application source code.

---

# 📸 Jenkins Credentials

> Replace this section with your Jenkins Credentials screenshot.

```markdown
![Jenkins Credentials](YOUR_JENKINS_CREDENTIALS_SCREENSHOT)
```

---

# 📂 Artifact Promotion Workflow

One of the main goals of this project is to demonstrate an enterprise-style artifact promotion strategy.

Traditional CI pipelines often rebuild applications multiple times across environments.

This project avoids that risk by following a **Build Once, Promote Everywhere** model.

```text
Source Code

      │

      ▼

Build Once

      │

      ▼

Digitally Sign Artifact

      │

      ▼

Publish to Nexus

      │

      ▼

Download Same Artifact

      │

      ▼

Verify Signature

      │

      ▼

Docker Image

      │

      ▼

Deploy Everywhere
```

This guarantees that every environment receives the exact same verified application artifact.

---

# 🧠 Engineering Decisions

Throughout this project, several design decisions were made to align the implementation with real-world enterprise practices.

| Decision | Reason |
|----------|--------|
| Two-stage Jenkins pipeline | Separate application build from containerization |
| Maven Wrapper | Ensure consistent Maven version |
| GPG Signing | Protect artifact integrity |
| Nexus Repository | Centralized artifact storage |
| Immutable Artifact Promotion | Prevent rebuilding different binaries |
| SonarQube Quality Gate | Block poor-quality code |
| SBOM Generation | Improve dependency visibility |
| Trivy SBOM Scan | Detect vulnerable dependencies early |
| Jenkins Managed Settings | Secure Maven configuration |
| Metadata-Based Artifact Download | Guarantee reproducible builds |

---

# 💡 Challenges Solved During This Project

Building this project involved solving several practical engineering problems.

### Jenkins & Pipeline

- Configured a multi-stage Jenkins pipeline
- Managed Jenkins credentials securely
- Used Jenkins Config File Provider for Maven settings
- Automatically triggered downstream pipelines

### Maven

- Configured Maven Wrapper
- Implemented Snapshot artifact publishing
- Resolved timestamped snapshot versions
- Captured Maven metadata automatically

### GPG

- Imported private keys into Jenkins
- Solved non-interactive GPG signing issues
- Verified artifact signatures in downstream stages

### SonarQube

- Integrated static code analysis
- Configured Quality Gate validation
- Prevented promotion of failed builds

### Nexus Repository

- Configured Snapshot Repository
- Published signed artifacts
- Downloaded immutable artifacts for promotion

### Docker

- Built images from verified artifacts
- Used non-root runtime container
- Implemented reproducible container builds

---

# 📚 Key Learnings

This project provided hands-on experience with multiple enterprise DevSecOps concepts.

Some of the key takeaways include:

- Designing multi-stage Jenkins pipelines
- Applying Shift Left Security
- Understanding software supply-chain security
- Managing immutable artifacts
- Digitally signing application artifacts
- Verifying artifact authenticity
- Managing Maven repositories
- Implementing quality gates
- Generating Software Bill of Materials
- Vulnerability scanning using Trivy
- Building secure Docker images
- Using Jenkins Credentials securely
- Promoting artifacts across pipeline stages

---

# 🚀 Future Enhancements

The current implementation focuses on secure artifact creation and containerization.

The next phase will extend the pipeline with deployment and runtime security.

### Container Security

- Generate Container SBOM
- Trivy Image Vulnerability Scan
- Docker Bench Security

### Container Registry

- Push Docker Image to Docker Hub
- Push Docker Image to Amazon ECR

### Image Signing

- Cosign Image Signing
- Cosign Signature Verification

### Kubernetes

- Deploy to Kubernetes
- Health Checks
- Readiness & Liveness Probes
- Rolling Updates
- Rollbacks

### GitOps

- ArgoCD Deployment
- Automatic Image Updates
- GitOps Synchronization

### Notifications

- Slack Notifications
- Email Notifications

---

# 📊 Project Highlights

- ✅ Enterprise Two-Stage Jenkins Pipeline
- ✅ Build Once, Promote Everywhere Strategy
- ✅ Immutable Artifact Promotion
- ✅ GPG Artifact Signing & Verification
- ✅ SonarQube Quality Gate Enforcement
- ✅ CycloneDX SBOM Generation
- ✅ Trivy SBOM Vulnerability Scanning
- ✅ Sonatype Nexus Repository Integration
- ✅ Secure Credential Management
- ✅ Docker Image Creation from Verified Artifact

---

# 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

If you have ideas for improving the pipeline, security controls, or documentation, feel free to:

1. Fork this repository.
2. Create a feature branch.
3. Commit your changes.
4. Open a Pull Request.

---

# 📜 License

This project is licensed under the MIT License.

Feel free to use this repository for learning and educational purposes.

---

# 👨‍💻 Author

**Rajkumar Dubey**

DevOps & DevSecOps Engineer

### Connect with Me

- 💼 LinkedIn: https://www.linkedin.com/in/your-linkedin-profile
- 🐙 GitHub: https://github.com/your-github-username

---

# ⭐ Support

If you found this project helpful or learned something from it:

⭐ Star this repository

🍴 Fork it

📢 Share it with others

Every contribution and star is appreciated.

---

# 🎯 Final Thoughts

Modern DevOps is no longer just about automating builds.

It is about building **trusted software delivery pipelines** where every artifact is traceable, verified, secure, and reproducible.

This project demonstrates how common DevSecOps tools—including Jenkins, Maven, SonarQube, Nexus Repository, GPG, Trivy, and Docker—can be integrated into a practical CI workflow that emphasizes software supply chain security and immutable artifact promotion.

While there are many possible extensions, such as container image signing, Kubernetes deployment, GitOps, and runtime security, the current implementation establishes a solid foundation for an enterprise-style CI pipeline.

Thank you for taking the time to explore this project. Feedback and suggestions are always welcome.


