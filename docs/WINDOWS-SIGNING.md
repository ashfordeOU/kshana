# Windows signing (Azure Trusted Signing)

Kshana Desktop for Windows ships **unsigned** for now (owner decision K5). The signing flow is built into
`.github/workflows/desktop.yml` and switched off. This page says how the owner switches it on. It holds no
secret values and never should.

## What the workflow does

On the `windows-2022` leg of the Desktop workflow, after `cargo tauri build`:

1. **Windows signing switch.** Signing is on only when the repository variable `WINDOWS_SIGNING` is
   `azure` **and** all six secrets below are set. The step tests the secrets for presence only; their
   values never reach a shell.
2. When it is off, the job prints a notice, *Windows build is UNSIGNED*, and uploads the artefact as
   `kshana-desktop-unsigned-windows-2022`. When the variable is `azure` but a secret is missing, it
   names the missing secrets in a warning and still builds unsigned.
3. When it is on, `azure/trusted-signing-action` (pinned by commit, v2.0.0) signs every `.exe` and
   `.msi` under `apps/desktop/src-tauri/target/release/bundle` with SHA-256 file and timestamp digests
   (timestamp server `http://timestamp.acs.microsoft.com`). A PowerShell step then checks each file with
   `Get-AuthenticodeSignature` and fails the job unless every status is `Valid`. The artefact is named
   `kshana-desktop-signed-windows-2022`.

Pull requests from forks receive no secrets, so they always take the unsigned path.

## Switching it on (owner)

1. In Azure, create an Artifact Signing (Trusted Signing) account and a certificate profile, and an app
   registration (service principal) with the *Trusted Signing Certificate Profile Signer* role on that
   profile. Identity validation for the profile is done in the Azure portal.
2. In GitHub: **Settings → Secrets and variables → Actions → Secrets → New repository secret**, add:

   | Secret | Value |
   |---|---|
   | `AZURE_TENANT_ID` | the directory (tenant) ID of the app registration |
   | `AZURE_CLIENT_ID` | the application (client) ID |
   | `AZURE_CLIENT_SECRET` | a client secret of the app registration |
   | `AZURE_SIGNING_ENDPOINT` | the account's regional endpoint, for example `https://weu.codesigning.azure.net/` |
   | `AZURE_SIGNING_ACCOUNT` | the signing account name |
   | `AZURE_SIGNING_PROFILE` | the certificate profile name |

3. In GitHub: **Settings → Secrets and variables → Actions → Variables → New repository variable**,
   name `WINDOWS_SIGNING`, value `azure`.
4. Run the Desktop workflow (**Actions → Desktop → Run workflow**) and check that the Windows leg says
   *Windows signing is on* and that **Check the Windows signatures** lists each installer.

To switch it off again, delete the variable or set it to anything other than `azure`. Rotate the client
secret in Azure and update `AZURE_CLIENT_SECRET` before it expires.

## Not yet covered

- The executable inside the installers is signed only as part of the installer; signing it before
  bundling (Tauri's `signCommand`) is a later step.
- The macOS release (`desktop-release.yml`) attaches a signed `.dmg` to a release; there is no Windows
  equivalent yet. The signed Windows installers are workflow artefacts.
- Installing the MSI on a clean `windows-2022` runner in CI (roadmap Q1) is not part of this flow.
