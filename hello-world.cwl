cwlVersion: v1.2
class: CommandLineTool

requirements:
  ResourceRequirement:
    ramMin: 500
    coresMin: 1
  NetworkAccess:
    networkAccess: true
  DockerRequirement:
    dockerPull: ghcr.io/dmastrapasqua/ndvi-cdse:0.1.0

baseCommand:
  - python
  - -c

arguments:
  - |
    import os, json
    print("HELLO FROM CDSE", flush=True)
    print("AWS_ENDPOINT_URL_S3:", os.environ.get("AWS_ENDPOINT_URL_S3"), flush=True)
    os.makedirs("output", exist_ok=True)
    with open("output/collection.json", "w") as f:
        json.dump({
            "type": "Collection", "stac_version": "1.0.0", "id": "hello-result",
            "description": "hello world", "license": "proprietary",
            "extent": {"spatial": {"bbox": [[0,0,1,1]]}, "temporal": {"interval": [["2026-01-01T00:00:00Z","2026-01-01T00:00:00Z"]]}},
            "links": []
        }, f)

inputs: []

outputs:
  stac_collection:
    type: Directory
    outputBinding:
      glob: output