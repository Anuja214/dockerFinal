$ErrorActionPreference = "Stop"

$imageName = "weatherly"
$versions = @("1.0.0", "1.1.0")

foreach ($version in $versions) {
    $tag = "${imageName}:$version"
    Write-Host "Building $tag"
    docker build --build-arg "APP_VERSION=$version" --tag $tag .
    if ($LASTEXITCODE -ne 0) {
        throw "Docker build failed for $tag"
    }
}

docker image tag "${imageName}:1.1.0" "${imageName}:latest"
if ($LASTEXITCODE -ne 0) {
    throw "Failed to tag ${imageName}:latest"
}

Write-Host "Created images:"
docker image ls $imageName
if ($LASTEXITCODE -ne 0) {
    throw "Failed to list $imageName images"
}
