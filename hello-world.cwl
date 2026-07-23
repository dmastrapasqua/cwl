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
    print("HELLO FROM CDSE", flush=True)

inputs: []

outputs:
  stac_collection:
    type: Directory
    outputBinding:
      glob: output