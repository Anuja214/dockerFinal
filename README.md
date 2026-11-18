# Weatherly Docker version demo

Build two versioned images and a `latest` alias:

```powershell
.\build-images.ps1
```

The script creates `weatherly:1.0.0` and `weatherly:1.1.0`; `weatherly:latest` points to `1.1.0`. Each image has its application version in its OCI metadata and displays it in the page footer.

Run either version:

```powershell
docker run --rm -p 8080:80 weatherly:1.0.0
```

Open `http://localhost:8080`. Change the version list in `build-images.ps1` to build additional releases. These tags are local; pushing them to a registry requires tagging them with a registry name and running `docker push`.
