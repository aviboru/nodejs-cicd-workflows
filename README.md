# 📦 Node.js CI/CD Reusable Workflows

This repository provides reusable GitHub Actions workflows designed to standardize CI/CD pipelines across Node.js application repositories.

## ✅ What’s Included

| Workflow File            | Purpose                               |
|--------------------------|----------------------------------------|
| `build-compile.yml`     | Installs dependencies and prepares app |
| `build-test.yml`        | Runs linting and unit tests            |
| `build-quality.yml`     | Placeholder for code quality scanning  |
| `build-security.yml`    | Placeholder for SCA/SAST tools         |
| `build-package.yml`     | Builds and pushes Docker images        |
| `terraform-plan.yml`    | (To be added) Terraform planning       |
| `terraform-apply.yml`   | (To be added) Terraform apply          |
| `main-pipeline.yml`     | Sample consumer pipeline for reference |

---

## 🚀 How to Use

In your application repo (e.g. `node-app`), reference the reusable workflows:

```yaml
jobs:
  compile:
    uses: your-org/nodejs-cicd-workflows/.github/workflows/build-compile.yml@main

  test:
    needs: compile
    uses: your-org/nodejs-cicd-workflows/.github/workflows/build-test.yml@main

  quality:
    needs: test
    uses: your-org/nodejs-cicd-workflows/.github/workflows/build-quality.yml@main

  security:
    needs: quality
    uses: your-org/nodejs-cicd-workflows/.github/workflows/build-security.yml@main

  package:
    needs: security
    uses: your-org/nodejs-cicd-workflows/.github/workflows/build-package.yml@main
    with:
      REPO: ${{ github.repository }}
      COMMIT_SHA: ${{ github.sha }}
    secrets:
      DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
      DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
```

---

## 🛠 Requirements

- GitHub Actions enabled on consuming repo
- Secrets:
  - `DOCKER_USERNAME` / `DOCKER_PASSWORD` for Docker Hub auth
  - `ASSUME_ROLE_*` for each deploy environment (if using Terraform)

---

## 🧱 Contributing

Feel free to contribute enhancements like:
- Snyk, Trivy, or CodeQL integration
- GitHub environment approval gates
- Pull request-based Terraform planning

---