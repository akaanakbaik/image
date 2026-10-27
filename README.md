# Node.js Docker Images

Universal Node.js runtime images for JavaScript applications, bots, APIs, and web services.

**Repository:** [akaanakbaik/image-nodejs](https://github.com/akaanakbaik/image-nodejs)

**Container registry:** `ghcr.io/akaanakbaik/image`

**GitHub Actions:** [https://github.com/akaanakbaik/image-nodejs/actions](https://github.com/akaanakbaik/image-nodejs/actions)

## Available images

| Runtime version | Image | Additional tag |
|---|---|---|
| 26 | `ghcr.io/akaanakbaik/image:nodejs_26` | — |
| 25 | `ghcr.io/akaanakbaik/image:nodejs_25` | — |
| 24 | `ghcr.io/akaanakbaik/image:nodejs_24` | — |
| 23 | `ghcr.io/akaanakbaik/image:nodejs_23` | — |
| 22 | `ghcr.io/akaanakbaik/image:nodejs_22` | — |
| 21 | `ghcr.io/akaanakbaik/image:nodejs_21` | — |
| 20 | `ghcr.io/akaanakbaik/image:nodejs_20` | — |
| 19 | `ghcr.io/akaanakbaik/image:nodejs_19` | — |
| 18 | `ghcr.io/akaanakbaik/image:nodejs_18` | — |

## Supported platforms

- `linux/amd64` — x86-64 servers
- `linux/arm64` — ARM64 servers

Images are built through GitHub Actions using Docker Buildx.
Platform support describes the configured build targets; consult the published manifest for confirmation.

## Quick start with Docker

```bash
docker pull ghcr.io/akaanakbaik/image:nodejs_26
docker run --rm ghcr.io/akaanakbaik/image:nodejs_26
```

Run an application from the current directory:

```bash
docker run --rm -v "$PWD:/home/container" \
  -e STARTUP="node index.js" \
  ghcr.io/akaanakbaik/image:nodejs_26
```

## Pterodactyl setup

1. Open the Pterodactyl administrator panel.
2. Edit the relevant Egg's Docker image list.
3. Add one of the image URLs from the table above.
4. Configure the Egg startup command for your application.
5. Select the image for the server and restart or reinstall as appropriate.

The image alone does not replace a Pterodactyl Egg.
The Egg must provide a compatible startup configuration and installation procedure.

### Startup examples

```bash
node index.js
npm start
npm run dev
```

Choose **one** startup command appropriate to your application.
For Pterodactyl, set the `STARTUP` environment variable if required by the image's entrypoint.

## Working directory and permissions

- Application working directory: `/home/container`.
- Application files should be stored in a persistent Pterodactyl volume.
- Avoid running applications as root.
- Ensure mounted files are writable by the container user.

## Environment variables

| Variable | Purpose |
|---|---|
| `STARTUP` | Shell command executed by the container entrypoint, when supported |
| Application-specific variables | Configure your bot, API, or service |

Do not commit credentials, API tokens, or passwords to the repository.
Pass secrets through the server's protected environment settings.

## CI/CD

The GitHub Actions workflow builds and tests runtime images.
Successful publishing jobs push images to GitHub Container Registry.

Typical workflow:

1. Update runtime versions or image configuration.
2. Commit and push to `master`.
3. Wait for GitHub Actions tests.
4. Publish the multiarchitecture image.
5. Confirm the required tag is available before production deployment.

## Security and maintenance

- Prefer maintained runtime versions for production.
- Older versions may no longer receive upstream security fixes.
- Pin an exact image digest when reproducibility is required.
- Image tags may be republished after dependency or base-image updates.
- Rebuild images when upstream security patches become available.
- Review third-party dependencies and application packages separately.
- Use least-privilege container settings and appropriate resource limits.
- Avoid exposing unnecessary ports or sensitive files.

## Limitations

- These are runtime/toolchain images, not complete application templates.
- Application dependencies and startup configuration remain your responsibility.
- A successful image build does not guarantee compatibility with every Egg.
- Published GHCR package visibility may require configuration to allow anonymous pulls.
- Runtime-specific behavior can differ across versions and CPU architectures.

## Troubleshooting

If a server does not start:

1. Confirm the selected image tag exists.
2. Inspect the Pterodactyl console and Wings logs.
3. Check the startup command and required files.
4. Verify file permissions and mounted volumes.
5. Confirm all required application dependencies are installed.

## Contributing

Bug reports and improvements can be submitted through GitHub Issues or pull requests.

**Issues:** https://github.com/akaanakbaik/image-nodejs/issues

## License

Refer to the repository's LICENSE file if present.
No license is implied when a LICENSE file is absent.

## Disclaimer

These images are community-maintained and are not official Pterodactyl images.
Upstream runtime projects retain their respective trademarks and licenses.
