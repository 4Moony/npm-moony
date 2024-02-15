
### Prerequisites

Before running this project, ensure you have the following prerequisites installed:

- Docker: Ensure you have Docker installed on your system. You can download and install Docker from [here](https://www.docker.com/get-started).

- npm: You need npm (Node Package Manager) installed to manage dependencies and publish packages. npm typically comes with Node.js installation. You can download and install Node.js, which includes npm, from [here](https://nodejs.org/).

### Based on Verdaccio

This project is based on Verdaccio, a lightweight npm registry suitable for running on your local machine or in your private network. For more information about Verdaccio, please refer to the [official documentation](https://verdaccio.org/docs/cli-registry/).

---

### Building the Docker Image

To build the Docker image, run the following command in your terminal:

```bash
docker build -t npm-moony .
```

### Building the Docker Image

To build the Docker image, run the following command in your terminal:

```bash
docker build -t npm-moony .
```

This command builds a Docker image named `npm-local` using the Dockerfile in the current directory.

### Running the Docker Container

After building the Docker image, you can run a Docker container using the following command:

```bash
docker run -p 4873:4873 -d npm-moony
```

This command starts a Docker container based on the `npm-moony` image, exposing port `4873` on your local machine. The container runs in detached mode (`-d`), allowing you to continue using your terminal.

### Configuring npm to Use the Local Registry

To configure npm to use your local npm registry, execute the following command:

NPM Default
```bash
npm config set registry https://registry.npmjs.com
```

NPM Moony
```bash
npm config set @moony:registry http://localhost:4873
```

This command sets the registry URL for npm to `http://localhost:4873`, ensuring that npm commands interact with your local registry instead of the public npm registry.

By following these steps, you can set up and use a local npm registry using Docker, enabling you to publish and install npm packages locally. Adjust the commands as needed based on your specific requirements and environment.

### Publish a New npm Package to Local npm Server

1. **Prepare the Package:**
   Ensure that you have prepared the npm package you want to publish. This involves creating a directory structure for the package, ensuring that `package.json` is configured correctly, and including all necessary files.
  ```
{
   "name": "@moony/your-package",
   ...
   }
   ```

2. **Authentication (Optional):**
   If you've set up authentication in Verdaccio (e.g., using `htpasswd`), have your credentials ready to authenticate the package upload. Add your credentials to the `htpasswd` file as necessary.

3. **Publish the Package:**
   Publish the npm package to your local server using the `npm publish` command. Make sure you're in the root directory of the package before executing the command.
   ```sh
   cd /path/to/your/package
   npm publish --registry=http://localhost:4873
   ```
   This command uploads the package to the local Verdaccio server, making it available for installation by other projects.

4. **Verify:**
   After publishing the package, verify its successful upload by navigating to the Verdaccio interface in your browser (usually at `http://localhost:4873`) or by using the Verdaccio API.

Ensure to adjust the commands as necessary based on your Verdaccio server's specific configuration and the structure of your npm package.